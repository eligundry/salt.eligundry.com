{% set langserver_path = pillar['user']['home'] + '/.lib/php-language-server' %}

php:
  pkg.installed:
    - pkgs:
      {% if grains['os'] == 'MacOS' %}
      - homebrew/php/php72
      - homebrew/php/composer
      {% else %}
      - composer
      - php7.0
      {% endif %}

{{ pillar['user']['home'] }}/.composer/auth.json:
  file.serialize:
    - dataset_pillar: composer-auth
    - formatter: json
    - encoding: UTF-8
    - user: {{ pillar['user']['name'] }}
    - mode: 600
    - show_changes: false

php-language-server-composer:
  file.managed:
    - name: {{ langserver_path }}/composer.json
    - source: salt://shared/php/language-server-composer.json
    - makedirs: true
    - user: {{ pillar['user']['name'] }}

php-language-server:
  composer.installed:
    - name: {{ langserver_path }}
    - user: {{ pillar['user']['name'] }}
    - require:
      - php
      - php-language-server-composer
