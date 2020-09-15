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

database-migration:
  docker_container.run:
    - image: {{ api_image }}
    - replace: true
    - binds:
      - {{ api_data_dir }}:/opt/data
    - environment:
      - GOOSE_DRIVER: sqlite3
      - GOOSE_DBSTRING: /opt/data/api.db
    - entrypoint: ''
    - command: 'cd /src/migrations && goose up'
    - require:
      - {{ api_image }}

eligundry-api:
  docker_container.running:
    - image: {{ api_image }}
    - restart_policy: always
    - environment:
      - AUTH_USER: '{{ salt['pillar.get']('website:basic_auth:username') }}'
      - AUTH_PASSWORD: '{{ salt['pillar.get']('website:basic_auth:password') }}'
      - DO_SPACES_ENDPOINT: {{ salt['pillar.get']('digitalocean:spaces:endpoint') }}
      - DO_SPACES_BUCKET: {{ salt['pillar.get']('digitalocean:spaces:bucket') }}
      - DO_ACCESS_KEY: {{ salt['pillar.get']('digitalocean:spaces:access_key') }}
      - DO_SECRET_KEY: {{ salt['pillar.get']('digitalocean:spaces:secret_key') }}
      - DO_CDN_URL: {{ salt['pillar.get']('digitalocean:spaces:cdn_url') }}
    - networks:
      - https-portal-network:
        - aliases:
          - eligundry-api
    - binds:
      - {{ api_data_dir }}:/opt/data
    - require:
      - {{ api_image }}
      - https-portal-network
