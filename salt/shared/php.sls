php:
  pkg.installed:
    - pkgs:
      - composer
      - php

{{ pillar['user']['home'] }}/.composer/auth.json:
  file.serialize:
    - dataset_pillar: composer-auth
    - formatter: json
    - encoding: UTF-8
    - user: {{ pillar['user']['name'] }}
    - mode: 600
    - show_changes: false

{% if grains['os'] == 'Ubuntu' %}

php7.0-fpm:
  service.disabled

{% endif %}
