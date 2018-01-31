{% set letsencrypt_dir = '/opt/letsencrypt' %}
{% set webserver_dir = '/opt/webserver' %}
{% set pull_latest = pillar['docker_pull_latest'] %}
{% set eligundry_image = 'eligundry/eligundry.com' %}
{% set letsencrypt_image = 'jrcs/letsencrypt-nginx-proxy-companion' %}
{% set docker_gen_image = 'jwilder/docker-gen' %}
{% set nginx_image = 'nginx:alpine' %}

{{ letsencrypt_dir }}:
  file.directory:
    - user: docker
    - group: docker
    - dir_mode: 775
    - file_mode: 660
    - makedirs: True
    - recurse:
      - user
      - group
      - mode

{{ webserver_dir }}:
  file.directory:
    - user: docker
    - group: docker
    - dir_mode: 775
    - file_mode: 664
    - makedirs: True
    - recurse:
      - user
      - group
      - mode

{{ webserver_dir }}/nginx.tmpl:
  file.managed:
    - source: salt://server/nginx/nginx.tmpl
    - user: docker
    - group: docker
    - require:
      - {{ webserver_dir }}

{{ nginx_image }}:
  docker_image.present:
    - force: {{ pull_latest }}

{{ docker_gen_image }}:
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
      - {{ letsencrypt_dir }}:/etc/nginx/certs:ro
    - port_bindings:
      - "80:80"
      - "443:443"
    - restart_policy: always
    - require:
      - {{ nginx_image }}
      - {{ letsencrypt_dir }}

nginx-gen:
  docker_container.running:
    - image: {{ docker_gen_image }}
    - entrypoint: |
        /usr/local/bin/docker-gen
          \ -notify-sighup nginx
          \ -watch -only-exposed
          \ /etc/docker-gen/templates/nginx.tmpl
          \ /etc/nginx/conf.d/default.conf
    - binds:
      - /var/run/docker.sock:/tmp/docker.sock:ro
      - {{ webserver_dir }}/nginx.tmpl:/etc/docker-gen/templates/nginx/nginx.tmpl
    - volumes_from:
      - nginx-proxy
    - require:
      - nginx-proxy

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
    - require:
      - {{ letsencrypt_dir }}
      - {{ letsencrypt_image }}
      - nginx-proxy

{% endif %}
