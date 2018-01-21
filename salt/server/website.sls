{% set letsencrypt_dir = '/opt/letsencrypt' %}
{% set pull_latest = pillar['docker_pull_latest'] %}
{% set website = pillar['website'] %}
{% set eligundry_image = 'eligundry/eligundry.com' %}
{% set nginx_image = 'jwilder/nginx-proxy:alpine' %}
{% set letsencrypt_image = 'jrcs/letsencrypt-nginx-proxy-companion' %}

{{ letsencrypt_dir }}:
  file.directory:
    - user: docker
    - group: docker
    - recurse: true
    - dir_mode: 664
    - file_mode: 660
    - makedirs: true

{{ eligundry_image }}:
  docker_image.present:
    - force: {{ pull_latest }}

eligundry.com:
  docker_container.running:
    - image: {{ eligundry_image }}
    - environment:
      - VIRTUAL_HOST: {{ website['virtual_host'] }}
      - VIRTUAL_PORT: 8080
      - LETSENCRYPT_HOST: {{ website['letsencrypt']['host'] }}
      - LETSENCRYPT_EMAIL: {{ website['letsencrypt']['email'] }}
      - LETSENCRYPT_TEST: "{{ website['letsencrypt']['test'] }}"
      - ENABLE_IPV6: "true"
    - restart_policy: always
    - require:
      - nginx-proxy
      - {{ eligundry_image }}

{{ nginx_image }}:
  docker_image.present:
    - force: {{ pull_latest }}

nginx-proxy:
  docker_container.running:
    - image: {{ nginx_image }}
    - volumes:
      - /etc/nginx/conf.d
      - /etc/nginx/vhost.d
      - /usr/share/nginx/html
    - binds:
      - /var/run/docker.sock:/tmp/docker.sock:ro
      - {{ letsencrypt_dir }}:/etc/nginx/certs:ro
    - port_bindings:
      - "80:80"
      - "443:443"
    - restart_policy: always
    - require:
      - {{ nginx_image }}
      - {{ letsencrypt_dir }}

# This is disabled in Vagrant because it will fail to validate certs and make
# the dev website impossible to reach because certs and will force SSL on the
# Nginx reverse proxy.
{% if salt['grains.get']('virtual') != 'VirtualBox' %}

{{ letsencrypt_image }}:
  docker_image.present:
    - force: {{ pull_latest }}

letsencrypt:
  docker_container.running:
    - image: {{ letsencrypt_image }}
    - volumes_from:
      - nginx-proxy
    - binds:
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - {{ letsencrypt_dir }}:/etc/nginx/certs:rw
    - restart_policy: always
    - environment:
      - ACME_TOS_HASH=cc88d8d9517f490191401e7b54e9ffd12a2b9082ec7a1d4cec6101f9f1647e7b
    - require:
      - {{ letsencrypt_dir }}
      - {{ letsencrypt_image }}
      - nginx-proxy

{% endif %}
