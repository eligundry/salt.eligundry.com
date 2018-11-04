{% set ip_address = salt['grains.get']('ip4_interfaces:eth0:0') %}
{% set virtual_host = pillar['pi-hole']['virtual_host'] %}
{% set pi_hole_image = 'diginc/pi-hole:latest' %}
{% set pull_latest = pillar['docker_pull_latest'] %}
{% set pi_hole_dir = '/opt/pi-hole' %}

{{ pi_hole_dir }}:
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

{{ pi_hole_dir }}/robots.txt:
  file.managed:
    - user: docker
    - group: docker
    - contents: |
        User-agent: *
        Disallow: /
    - require:
      - {{ pi_hole_dir }}

{{ pi_hole_dir }}/pihole-FTL.db:
  file.touch:
    - require:
      - {{ pi_hole_dir }}

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
      - WEBPASSWORD: "{{ pillar['pi-hole']['password'] }}"
    - restart_policy: always
    - binds:
      - {{ pi_hole_dir }}/pihole-FTL.db:/etc/pihole/pihole-FTL.db
      - {{ pi_hole_dir }}/robots.txt:/var/www/html/pihole/robots.txt
    - require:
      - {{ pi_hole_image }}
      - {{ pi_hole_dir }}/pihole-FTL.db
      - {{ pi_hole_dir }}/robots.txt
