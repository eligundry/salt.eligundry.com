{% set letsencrypt_dir = '/opt/letsencrypt' %}
{% set eligundry_image = 'eligundry/eligundry.com' %}
{% set nginx_image = 'jwilder/nginx-proxy' %}
{% set pull_latest = pillar['docker_pull_latest'] %}

{{ letsencrypt_dir }}:
  file.directory:
    - user: docker
    - group: docker

{{ eligundry_image }}:
  dockerng.image_present:
    - force: {{ pull_latest }}

eligundry.com:
  dockerng.running:
    - image: {{ eligundry_image }}
    - environment:
      - VIRTUAL_HOST: {{ pillar['website']['virtual_host'] }}
      - LETSENCRYPT_HOST: {{ pillar['website']['letsencrypt']['host'] }}
      - LETSENCRYPT_EMAIL: {{ pillar['website']['letsencrypt']['email'] }}
      - LETSENCRYPT_TEST: "{{ pillar['website']['letsencrypt']['test'] }}"
      - ENABLE_IPV6: "True"
    - port_bindings:
      - "80:80"
    - restart_policy: always
    - require:
      - nginx-proxy
      - {{ eligundry_image }}

{{ nginx_image }}:
  dockerng.image_present:
    - force: {{ pull_latest }}

nginx-proxy:
  dockerng.running:
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
      - {{ letsencrypt_dir }}
      - {{ nginx_image }}

# This is disabled in Vagrant because it will fail to validate certs and make
# the dev website impossible to reach because certs and will force SSL on the
# Nginx reverse proxy.
{% if salt['grains.get']('virtual') != 'VirtualBox' %}

{% set letsencrypt_image = 'jrcs/letsencrypt-nginx-proxy-companion' %}

{{ letsencrypt_image }}:
  dockerng.image_present:
    - force: {{ pull_latest }}

letsencrypt:
  dockerng.running:
    - image: {{ letsencrypt_image }}
    - volumes_from:
      - nginx-proxy
    - binds:
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - {{ letsencrypt_dir }}:/etc/nginx/certs:rw
    - restart_policy: always
    - require:
      - {{ letsencrypt_dir }}
      - {{ letsencrypt_image }}
      - nginx-proxy

{% endif %}
