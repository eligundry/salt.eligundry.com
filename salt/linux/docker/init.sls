{% set cleanup_frequency = '@daily' if grains['eligundry_device'] == 'server' else '@monthly' %}
{% set codename = grains['lsb_distrib_codename'] %}

{% if codename == 'bullseye' %}
  {% set codename = 'buster' %}
{% endif %}

docker-ppa:
  pkgrepo.managed:
    - humanname: 'Docker offical PPA'
    - name: 'deb [arch=amd64] https://download.docker.com/linux/{{ codename }} {{ grains['lsb_distrib_codename'] }} stable'
    - key_url: https://download.docker.com/linux/debian/gpg
    - file: /etc/apt/sources.list.d/docker.list

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
    - shell: /usr/sbin/nologin
    - require:
      - docker-group

docker:
  pkg.installed:
    - pkgs:
      - docker-ce
      - docker-ce-cli
      - containerd.io
      - docker-compose
    - require:
      - docker-ppa

old-docker-pkgs:
  pkg.removed:
    - pkgs:
      - docker
      - docker-engine
      - docker.io

docker-service-file:
  file.managed:
    - name: /etc/systemd/system/docker.service.d/docker_user.conf
    - source: salt://linux/docker/docker_user.conf
    - makedirs: True
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        dockerd_path: /usr/bin/dockerd

docker-service:
  service.running:
    - name: docker
    - enable: true
    - watch:
      - file: /etc/systemd/system/docker.service.d/docker_user.conf

minikube:
  file.managed:
    - comment: "Local Kubernetes Server"
    - name: /usr/local/bin/minikube
    - source: https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    - mode: 755
    - show_changes: False
    - skip_verify: True

docker-py:
  pip.installed:
    - name: docker

docker-gc:
  docker_image.absent:
    - name: spotify/docker-gc
    - require:
      - docker-py

docker-cleanup:
  cron.present:
    - special: '{{ cleanup_frequency }}'
    - name: "docker image prune -f && docker volume prune -f && docker container prune -f"
    - comment: "Clear our unneeded Docker images."
