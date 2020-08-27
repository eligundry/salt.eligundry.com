# This state is to setup the Salt REST API so that I can trigger deploys from
# GitHub Actions without ssh'ing. The docs suggest to have this protected by SSL 
# and to generate self signed certificates to make this secure. I don't want to 
# do self signed certs and I have a reverse proxy that handles LetsEncrypt, so
# I'm going to route all traffic through that for this. Unfortunately, there 
# isn't a Docker image for this so I'm going to use https-portals ability to 
# proxy traffic from the reverse proxy to the API that way.

{% for user in pillar['salt-api']['users'] %}
salt-api-{{ user['name'] }}:
  user.present:
    - name: {{ user['name'] }}
    - createhome: false
    - shell: /bin/bash
{% endfor %}

salt-api:
  pkg.installed

salt-api-service:
  service.running:
    - name: salt-api
    - enable: true
    - watch:
      - file: /etc/salt/master
