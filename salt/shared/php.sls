php:
  pkg.installed:
    - pkgs:
      - composer
      - php
      - php-curl
      - php-mbstring
      - php-xml

composer-auth-file:
  file.serialize:
    - name: {{ pillar['user']['home'] }}/.composer/auth.json
    - dataset_pillar: composer-auth
    - formatter: json
    - encoding: UTF-8
    - user: {{ pillar['user']['name'] }}
    - mode: 600
    - show_changes: false
    - makedirs: true

php7.0-fpm:
  service.disabled

{% for service in ['phpsessionclean.timer', 'phpsessionclean.service', 'apache2'] %}

{{ service }}-disabled:
  service.disabled

{{ service }}-dead:
  service.dead

{% endfor %}

psysh-php-manual:
  file.managed:
    - name: {{ pillar['user']['home'] }}/.local/share/psysh/php_manual.sqlite
    - source: http://psysh.org/manual/en/php_manual.sqlite
    - makedirs: true
    - replace: true
    - skip_verify: true
    - user: {{ pillar['user']['name'] }}
