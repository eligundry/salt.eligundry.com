{{ user_name }}:
  user.present:
    - groups:
      - docker
      - sudo
      - users
    - require:
      - docker
