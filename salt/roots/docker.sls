{% set os = grains['os']|lower %}
{% set release = 'stretch' %}

docker-group:
  group.present:
    - name: docker

docker-user:
  user.present:
    - name: docker
    - groups:
      - docker
      - users
    - createhome: True
    - fullname: Moby Dock
    - empty_password: True
    - require:
      - docker-group

docker-ppa:
  pkgrepo.managed:
    - humanname: Docker
    - name: deb https://apt.dockerproject.org/repo {{ os }}-{{ release }} main
    - keyid: 58118E89F3A912897C070ADBF76221572C52609D
    - keyserver: p80.pool.sks-keyservers.net
    - file: /etc/apt/sources.list.d/docker.list

docker:
  pkg.installed:
    - pkgs:
      - docker
      - docker-compose
      - docker-engine
    - require:
      - docker-ppa

docker-service-file:
  file.managed:
    - name: /etc/systemd/system/docker.service.d/docker_user.conf
    - source: salt://configs/docker/docker_user.conf
    - makedirs: True
    - user: root
    - group: root
    - mode: 644
    - require:
      - docker

docker-service-enabled:
  service.enabled:
    - name: docker

docker-service-running:
  service.running:
    - name: docker

service.systemctl_reload:
  module.run:
    - onchanges:
      - file: /etc/systemd/system/docker.service.d/docker_user.conf
