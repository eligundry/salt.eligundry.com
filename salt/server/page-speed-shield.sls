include:
  - server.https-portal

{% set pull_latest = pillar['docker_pull_latest'] %}
{% set image = 'eligundry/page-speed-shield:latest' %}

{{ image }}:
  docker_image.present:
    - force: {{ pull_latest }}

page-speed-shield:
  docker_container.running:
    - image: {{ image }}
    - restart_policy: always
    - networks:
      - https-portal-network:
        - aliases:
          - page-speed-shield
    - environment:
      - GOOGLE_API_KEY: '{{ salt['pillar.get']('google:api_key') }}'
    - require:
      - {{ image }}
      - https-portal-network
