{% set user = pillar['user'] %}
{% set is_linux = (grains['kernel'] == 'Linux') %}

{{ user['name'] }}:
  user.present:
    - fullname: {{ user['fullname'] }}
    # - password: {{ user['password'] }}
    {% if is_linux %}
    - groups:
      - sudo
      - users
      - docker
    {% endif %}
    - shell: {{ user['shell'] }}
    - createhome: True
    {% if is_linux  %}
    - require:
      - docker-group
    {% endif %}
