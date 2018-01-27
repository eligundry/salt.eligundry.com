{% set ip_address = grains['ipv4_interfaces']['eth0'] %}
{% set virtual_host = pillar['pi-hole']['virtual_host'] %}
{% set pi_hole_image = 'diginc/pi-hole:alpine' %}
{% set pull_latest = pillar['docker_pull_latest'] %}

{{ pi_hole_image }}:
  docker_image.present:
    - force: {{ pull_latest }}

pi-hole:
  docker_container.running:
    - image: {{ pi_hole_image }}
    - cap_add:
      - NET_ADMIN
    - environment:
      - ServerIP: {{ ip_address }}
      - VIRTUAL_HOST: {{ virtual_host }}
      - VIRTUAL_PORT: '80'
      - WEBPASSWORD: {{ pillar['pi-hole']['password'] }}
    - port_bindings:
      - "53:53/tcp"
      - "53:53/udp"
      - "8053:80/tcp"
    - extra_hosts:
      - 'pi-hole {{ virtual_host }}:{{ ip_address }}'
    - require:
      - docker
      - {{ pi_hole_image }}
