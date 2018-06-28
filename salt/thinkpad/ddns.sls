# Setup DDNS for my apartment using Cloudflare

{% set ddns = pillar['ddns'] %}
{% set ddns_image = 'oznu/cloudflare-ddns:latest' %}

{{ ddns_image }}:
  docker_image.present:
    - force: true

ddns:
  docker_container.running:
    - image: {{ ddns_image }}
    - restart: 'unless-stopped'
    - environment:
      - EMAIL: {{ ddns['email'] }}
      - API_KEY: {{ ddns['api_key'] }}
      - ZONE: {{ ddns['zone'] }}
      - subdomain: {{ ddns['subdomain'] }}
