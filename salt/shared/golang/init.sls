{% set user = pillar['user'] %}

golang:
  pkg.installed

{% if grains['os'] == 'MacOS' %}

dep:
  pkg.installed

{% else %}

dep:
  pkg.installed:
    - name: go-dep

gocode:
  pkg.installed

{% endif %}

{{ user['home'] }}/.netrc:
  file.managed:
    - user: {{ user['name'] }}
    - mode: 600
    - template: jinja
    - source: salt://shared/golang/netrc.sls
    - defaults:
        github_username: {{ salt['pillar.get']('user:github:username') }}
        github_access_token: {{ salt['pillar.get']('user:github:access_token') }}
