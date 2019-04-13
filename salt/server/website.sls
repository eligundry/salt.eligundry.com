{% set pull_latest = pillar['docker_pull_latest'] %}
{% set eligundry_image = 'eligundry/eligundry.com:latest' %}

{{ eligundry_image }}:
  docker_image.present:
    - force: {{ pull_latest }}

eligundry-website:
  docker_container.running:
    - image: {{ eligundry_image }}
    - restart_policy: always
    - networks:
      - https-portal-network-test:
        - aliases:
          - eligundry-website
    - require:
      - {{ eligundry_image }}
      - https-portal-network
