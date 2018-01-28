{% set ip_address = salt['grains.get']('ip4_interfaces:eth0:0') %}
{% set virtual_host = pillar['pi-hole']['virtual_host'] %}
{% set pi_hole_image = 'diginc/pi-hole' %}
{% set pull_latest = pillar['docker_pull_latest'] %}
{% set website = pillar['website'] %}

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
      - LETSENCRYPT_HOST: {{ virtual_host }}
      - LETSENCRYPT_EMAIL: {{ website['letsencrypt']['email'] }}
      - LETSENCRYPT_TEST: "{{ website['letsencrypt']['test'] }}"
      - WEBPASSWORD: "{{ pillar['pi-hole']['password'] }}"
    # - port_bindings:
    #   - "53:53/tcp"
    #   - "53:53/udp"
    # - extra_hosts:
    #   - 'pi-hole {{ virtual_host }}:{{ ip_address }}'
    - require:
      - docker
      - {{ pi_hole_image }}
