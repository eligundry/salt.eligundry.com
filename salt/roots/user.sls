{% set user = pillar['user'] %}

{{ user['name'] }}:
  user.present:
    - fullname: {{ user['fullname'] }}
    - password: {{ user['password'] }}
    - groups:
      - docker
      - sudo
      - users
    - shell: {{ user['shell'] }}
    - createhome: True
    - require:
      - docker-group
