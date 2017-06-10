{% set openvpn_path = salt['pillar.get']('openvpn:path') %}
{% set openvpn_server = salt['pillar.get']('openvpn:server') %}
{% set openvpn_image = 'kylemanna/openvpn' %}
# {% set pihole_ip = salt['cmd.shell']("docker inspect --format '{{ .NetworkSettings.IPAddress }}' pi-hole") %}
{% set pull_latest = pillar['docker_pull_latest'] %}

{{ openvpn_path }}:
  file.directory:
    - makedirs: True
    - user: docker
    - group: docker
    - mode: 0660

{{ openvpn_path }}/openvpn.conf:
  file.managed:
    - source: salt://server/openvpn/openvpn.conf
    - user: docker
    - group: docker
    - makedirs: True
    - template: jinja
    - require:
      - {{ openvpn_path }}

{{ openvpn_path }}/ovpn_env.sh:
  file.managed:
    - source: salt://server/openvpn/ovpn_env.sh
    - user: docker
    - group: docker
    - makedirs: True
    - template: jinja
    - require:
      - {{ openvpn_path }}

{{ openvpn_image }}:
  dockerng.image_present:
    - force: {{ pillar['docker_pull_latest'] }}

# openvpn-server:
#   dockerng.running:
#     - image: {{ openvpn_image }}
#     - cap_add:
#       - NET_ADMIN
#     - port_bindings:
#       - "1194:1194/udp"
#     - binds:
#       - {{ openvpn_path }}:/etc/openvpn
#     - restart_policy: always
#     - dns:
#       - {{ pihole_ip }}
#     - require:
#       - {{ openvpn_image }}
#       - {{ openvpn_path }}
#       - pi-hole
#       - docker
