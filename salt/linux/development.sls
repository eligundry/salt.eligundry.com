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

redis:
  pkg.installed

redis-server-disabled:
  service.disabled:
    - name: redis-server

redis-server-dead:
  service.dead:
    - name: redis-server

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
