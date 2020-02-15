include:
  - server.https-portal

{% set pull_latest = pillar['docker_pull_latest'] %}
{% set eligundry_image = 'eligundry/eligundry.com:latest' %}
{% set beta_image = 'eligundry/website.eligundry.com:latest' %}
{% set api_image = 'eligundry/api.eligundry.com:latest' %}
{% set api_data_dir = '/opt/api-data' %}

{{ eligundry_image }}:
  docker_image.present:
    - force: {{ pull_latest }}

eligundry-website:
  docker_container.running:
    - image: {{ eligundry_image }}
    - restart_policy: always
    - networks:
      - https-portal-network:
        - aliases:
          - eligundry-website
    - require:
      - {{ eligundry_image }}
      - https-portal-network

{{ beta_image }}:
  docker_image.present:
    - force: {{ pull_latest }}

beta-eligundry-website:
  docker_container.running:
    - image: {{ beta_image }}
    - restart_policy: always
    - networks:
      - https-portal-network:
        - aliases:
          - beta-eligundry-website
    - require:
      - {{ beta_image }}
      - https-portal-network

{{ api_image }}:
  docker_image.present:
    - force: {{ pull_latest }}

{{ api_data_dir }}:
  file.directory:
    - user: docker
    - group: docker
    - dir_mode: 755
    - file_mode: 660
    - makedirs: true
    - recurse:
      - user
      - group
      - mode

eligundry-api:
  docker_container.running:
    - image: {{ api_image }}
    - restart_policy: always
    - networks:
      - https-portal-network:
        - aliases:
          - eligundry-api
    - binds:
      - {{ api_data_dir }}:/opt/data
    - require:
      - {{ api_image }}
      - https-portal-network
