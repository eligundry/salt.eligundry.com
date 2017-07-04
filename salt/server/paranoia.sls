{% set ip_address = salt['cmd.shell']("wget -qO- http://ipecho.net/plain") %}
{% set virtual_host = pillar['pi-hole']['virtual_host'] %}
{% set pi_hole_image = 'diginc/pi-hole:alpine' %}
{% set tor_privoxy_image = 'rdsubhas/tor-privoxy-alpine' %}
{% set pull_latest = pillar['docker_pull_latest'] %}

{{ pi_hole_image }}:
  dockerng.image_present:
    - force: {{ pull_latest }}

pi-hole:
  dockerng.running:
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

{{ tor_privoxy_image }}:
  dockerng.image_present:
    - force: {{ pull_latest }}

tor-privoxy:
  dockerng.running:
    - image: {{ tor_privoxy_image }}
    - port_bindings:
      - "8118:8118"
      - "9050:9050"
    - restart_policy: always
    - require:
      - docker
      - {{ tor_privoxy_image }}
