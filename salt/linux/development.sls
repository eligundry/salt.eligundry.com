cli-pkgs:
  pkg.latest:
    - comment: Bare bones CLI packages
    - pkgs:
      - curl
      - htop
      - mosh
      - silversearcher-ag
      - tmux
      - tree
      - vagrant
      - vim
      - zsh

python:
  pkg.latest:
    - pkgs:
      - python
      - python3
      - python-pip

php:
  pkg.latest:
    - pkgs:
      - composer
      - php7.0

mysql:
  pkg.latest:
    - pkgs:
      - libmysqlclient-dev
