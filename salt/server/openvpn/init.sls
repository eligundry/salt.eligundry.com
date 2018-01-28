{% set openvpn_path = pillar['openvpn']['path'] %}
{% set openvpn_server = pillar['openvpn']['server'] %}
{% set openvpn_image = 'kylemanna/openvpn' %}
{% set pull_latest = pillar['docker_pull_latest'] %}

{{ openvpn_path }}:
  file.directory:
    - makedirs: True
    - user: docker
    - group: docker
    - dir_mode: 775
    - file_mode: 660
    - recurse:
      - user
      - group
      - mode

{{ openvpn_path }}/openvpn.conf:
  file.managed:
    - source: salt://server/openvpn/openvpn.conf
    - user: docker
    - group: docker
    - makedirs: True
    - template: jinja
    - require:
      - {{ openvpn_path }}
      - pi-hole

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
  docker_image.present:
    - force: {{ pull_latest }}

openvpn-server:
  docker_container.running:
    - image: {{ openvpn_image }}
    - cap_add:
      - NET_ADMIN
    - port_bindings:
      - "1194:1194/udp"
    - binds:
      - {{ openvpn_path }}:/etc/openvpn
    - restart_policy: always
    - watch
      - file: {{ openvpn_path }}/openvpn.conf
    - require:
      - {{ openvpn_image }}
      - {{ openvpn_path }}
