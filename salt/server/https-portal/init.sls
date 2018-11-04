{% set https_portal_image = 'steveltn/https-portal' %}
{% set https_portal_dir = '/opt/https-portal' %}
{% set data = pillar['https-portal'] %}
{% set pull_latest = pillar['docker_pull_latest'] %}

nginx-proxy-stopped:
  docker_container.absent:
    - names:
      - nginx-proxy
      - letsencrypt

{{ https_portal_dir }}:
  file.directory:
    - user: docker
    - group: docker
    - dir_mode: 755
    - file_mode: 660
    - makedirs: True
    - recurse:
      - user
      - group
      - mode

{{ https_portal_image }}:
  docker_image.present:
    - force: {{ pull_latest }}

https-portal:
  docker_container.running:
    - image: {{ https_portal_image }}
    - environment:
      - STAGE: {{ data['stage'] }}
      - DOMAINS: {{ ', '.join((domain + ' -> ' + internal) for domain, internal in data['domains'].items()) }}
    - port_bindings:
      - "80:80"
      - "443:443"
    - binds:
      - {{ https_portal_dir }}:/var/lib/https-portal
    - restart_policy: always
    - require:
      - {{ https_portal_image }}
