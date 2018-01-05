go:
  pkg.installed:
    - pkgs:
      - golang-1.9
      - gocode

python:
  pkg.installed:
    - pkgs:
      - python
      - python3
      - python-pip

mosh:
  pkg.installed

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

silversearcher-ag:
  pkg.installed

vagrant:
  pkg.installed
