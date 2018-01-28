{% if grains['eligundry_device'] != 'server' %}

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

{% else %}

php:
  pkg.removed:
    - pkgs:
      - composer
      - php7.0

{% endif %}
