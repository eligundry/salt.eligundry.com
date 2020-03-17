{% set https_portal_image = 'steveltn/https-portal' %}
{% set https_portal_dir = '/opt/https-portal' %}
{% set https_portal_config_dir = '/opt/https-portal-configs' %}
{% set data = pillar['https-portal'] %}
{% set pull_latest = pillar['docker_pull_latest'] %}

nginx-proxy-stopped:
  docker_container.absent:
    - names:
      - nginx-proxy
      - letsencrypt
    - force: True

{{ https_portal_dir }}:
  file.directory:
    - user: docker
    - group: docker
    - dir_mode: 755
    - file_mode: 660
    - makedirs: true
    - recurse:
      - user
      - group
      - mode

{{ https_portal_config_dir }}:
  file.directory:
    - user: docker
    - group: docker
    - dir_mode: 755
    - file_mode: 660
    - makedirs: true
    - recurse:
      - user
      - group
      - mode

{% for filename in [
  'default.conf.erb', 
  'default.ssl.conf.erb', 
  'nginx.conf.erb', 
  'eligundry.com.ssl.conf.erb', 
  'salt.eligundry.ninja.ssl.conf.erb',
  'json-errors.conf',
  'json-error-locations.conf',
] %}

{{ https_portal_config_dir }}/{{ filename }}:
  file.managed:
    - source: salt://server/https-portal/{{ filename }}
    - user: docker
    - group: docker

{% endfor %}

{{ https_portal_image }}:
  docker_image.present:
    - force: {{ pull_latest }}

https-portal-network:
  docker_network.present:
    - driver: bridge

https-portal:
  docker_container.running:
    - image: {{ https_portal_image }}
    - environment:
      - ACCESS_LOG: 'on'
      - STAGE: {{ data['stage'] }}
      - DOMAINS: {{ ', '.join(data['domains']) }}
    - port_bindings:
      - "80:80"
      - "443:443"
    - networks:
      - https-portal-network:
        - aliases:
          - https-portal
    - binds:
      - {{ https_portal_dir }}:/var/lib/https-portal
      - {{ https_portal_config_dir }}/eligundry.com.ssl.conf.erb:/var/lib/nginx-conf/eligundry.com.ssl.conf.erb
      - {{ https_portal_config_dir }}/eligundry.com.ssl.conf.erb:/var/lib/nginx-conf/www.eligundry.com.ssl.conf.erb
      - {{ https_portal_config_dir }}/eligundry.com.ssl.conf.erb:/var/lib/nginx-conf/beta.eligundry.com.ssl.conf.erb
      - {{ https_portal_config_dir }}/salt.eligundry.ninja.ssl.conf.erb:/var/lib/nginx-conf/salt.eligundry.ninja.ssl.conf.erb
      - {{ https_portal_config_dir }}/json-errors.conf:/etc/nginx/json-errors.conf
      - {{ https_portal_config_dir }}/json-error-locations.conf:/etc/nginx/json-error-locations.conf
    - restart_policy: always
    - require:
      - {{ https_portal_image }}
      - https-portal-network
