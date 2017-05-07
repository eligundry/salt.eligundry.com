{% set os = grains['os']|lower %}
{% set release = grains['oscodename'] %}

docker-ppa:
  pkgrepo.managed:
    - humanname: Docker
    - name: deb [arch=amd64] https://download.docker.com/linux/{{ os }} {{ release }} main
    - key_url: https://download.docker.com/linux/{{ os }}/gpg
    - file: /etc/apt/sources.list.d/docker.list

docker:
  pkg.installed:
    - pkgs:
      - docker
      - docker-compose
    - require:
      - docker-ppa

docker-user:
  user.present:
    - name: docker
    - groups:
      - docker
      - users
    - createhome: True
    - fullname: Moby Dock
    - empty_password: True

docker-service:
  file.managed:
    - name: /etc/systemd/system/docker.service.d/docker_user.conf
    - source: salt://configs/docker/docker_user.conf
    - makedirs: True
    - user: root
    - group: root
    - mode: 644

service.systemctl_reload:
  module.run:
    - onchanges:
      - file: /etc/systemd/system/docker.service.d/docker_user.conf
