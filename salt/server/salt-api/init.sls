{% set docker_host_image = 'qoomon/docker-host:latest' %}
{% set pull_latest = pillar['docker_pull_latest'] %}

# This state is to setup the Salt REST API so that I can trigger deploys from
# GitHub Actions without ssh'ing. The docs suggest to have this protected by SSL 
# and to generate self signed certificates to make this secure. I don't want to 
# do self signed certs and I have a reverse proxy that handles LetsEncrypt, so
# I'm going to route all traffic through that for this. Unfortunately, there 
# isn't a Docker image for this so I'm going to use docker-host to proxy traffic
# from the reverse proxy to the API that way.

{% for user in pillar['salt-api']['users'] %}
salt-api-{{ user['name'] }}:
  user.present:
    - name: {{ user['name'] }}
    - password: {{ user['password'] }}
    - createhome: false
    - shell: /usr/sbin/nologin
{% endfor %}

salt-api:
  pkg.installed

{{ docker_host_image }}:
  docker_image.present:
    - force: {{ pull_latest }}

docker-host:
  docker_container.running:
    - image: {{ docker_host_image }}
    - cap_add:
      - NET_ADMIN
      - NET_RAW
    - networks:
      - host
      - https-portal-network:
        - aliases:
          - docker-host
    - require:
      - https-portal-network

salt-api-service:
  service.running:
    - name: salt-api
    - enable: true
    - watch:
      - file: /etc/salt/master
