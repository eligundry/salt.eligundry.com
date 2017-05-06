{% set user = pillar['user'] %}

{{ user['name'] }}:
  user.present:
    - groups:
      - docker
      - sudo
      - users
    - require:
      - docker
