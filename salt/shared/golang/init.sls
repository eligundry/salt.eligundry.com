{% set user = pillar['user'] %}
{% set home = user['home'] %}
{% set code = home + '/Code' %}

# Debian is currently pinned at go 1.11, but I need 1.12 or higher, so I need to
# install from source
{% if grains['os'] == 'Debian' %}

golang:
  pkg.removed

golang-from-source:
  archive.extracted:
    - name: /usr/local
    - source: https://dl.google.com/go/go1.14.linux-amd64.tar.gz
    - skip_verify: true
    - overwrite: true
    - user: root
    - group: root

{% else %}

golang:
  pkg.installed

{% endif %}


{{ home }}/.netrc:
  file.managed:
    - user: {{ user['name'] }}
    - mode: 600
    - template: jinja
    - source: salt://shared/golang/netrc.sls
    - defaults:
        github_username: {{ salt['pillar.get']('user:github:username') }}
        github_access_token: {{ salt['pillar.get']('user:github:access_token') }}

{{ code }}/go:
  file.directory:
    - user: {{ user['name'] }}
    - makedirs: true
    - recurse:
      - user

{{ code }}/go/src:
  file.directory:
    - user: {{ user['name'] }}
    - makedirs: true
    - recurse:
      - user

{% for key, repo in salt['pillar.get']('go-repos', {}).items()  %}

{{ key }}-go-repo:
  git.latest:
    - name: {{ repo['git'] }}
    - target: {{ code }}/go/src/{{ repo['path'] }}
    - identity: {{ home }}/.ssh/no_pass
    - user: {{ user['name'] }}
    - identity: {{ home }}/.ssh/no_pass
    - unless: 'test -d {{ code }}/go/src/{{ repo['path'] }}'

{% endfor %}
