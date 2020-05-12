{% set user = pillar['user'] %}

{{ user['home'] }}/.my.cnf:
  file.managed:
    - user: {{ user['name'] }}
    - mode: 600
    - template: jinja
    - source: salt://shared/talentinc/mysql_conf.sls
    - defaults:
        username: {{ salt['pillar.get']('talentinc:db:username') }}
        password: {{ salt['pillar.get']('talentinc:db:password') }}

{% grains['os'] == 'Debian' %}

{% set bluejeans_version = '2.1.2' %}

bluejeans:
  pkg.installed:
    - sources:
      - bluejeans: 'https://swdl.bluejeans.com/desktop-app/linux/2.1.2/BlueJeans.deb'

{% endif %}
