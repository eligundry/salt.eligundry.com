php:
  {% if grains['os'] == 'MacOS' %}
  pkg.installed:
    - pkgs:
      - homebrew/php/php72
      - homebrew/php/composer
  {% else %}
  pkg.installed:
    - pkgs:
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
