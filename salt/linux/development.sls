cli-pkgs:
  pkg.latest:
    - comment: Bare bones CLI packages
    - pkgs:
      - curl
      - htop
      - jq
      - mosh
      - rustc
      - silversearcher-ag
      - tmux
      - tree
      - vagrant
      - vim
      - zsh

python:
  pkg.installed:
    - pkgs:
      - python
      - python3
      - python-pip

php:
  pkg.installed:
    - pkgs:
      - composer
      - php7.0

mysql:
  pkg.installed:
    - pkgs:
      - libmysqlclient-dev

rust:
  pkg.installed:
    - pkgs:
      - rustc
      - rust-gdb

net-tools:
  pkg.installed
