{% set user = pillar['user'] %}
{% set is_linux = (grains['kernel'] == 'Linux') %}

{{ user['name'] }}:
  user.present:
    - fullname: {{ user['fullname'] }}
    # - password: {{ user['password'] }}
    - groups:
      - sudo
      - users
      {% if is_linux %}
      - docker
      {% endif %}
    - shell: {{ user['shell'] }}
    - createhome: True
    {% if is_linux  %}
    - require:
      - docker-group
    {% endif %}
