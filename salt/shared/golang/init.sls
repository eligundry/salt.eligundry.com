{% set user = pillar['user'] %}
{% set home = user['home'] %}
{% set code = home + '/Code' %}

golang:
  pkg.installed

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
    - unless: 'test -d {{ code }}/go/src/{{ repo['path'] }}'

{% endfor %}
