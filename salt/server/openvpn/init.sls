{% set openvpn_path = pillar['openvpn']['path'] %}
{% set openvpn_server = pillar['openvpn']['server'] %}
{% set openvpn_image = 'kylemanna/openvpn' %}
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
  docker_image.present:
    - force: {{ pull_latest }}

openvpn-server:
  docker_containe.running:
    - image: {{ openvpn_image }}
    - cap_add:
      - NET_ADMIN
    - port_bindings:
      - "1194:1194/udp"
    - binds:
      - {{ openvpn_path }}:/etc/openvpn
    - restart_policy: always
    - require:
      - {{ openvpn_image }}
      - {{ openvpn_path }}
