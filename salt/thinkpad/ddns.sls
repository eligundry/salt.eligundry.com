# Setup DDNS for my apartment using Cloudflare

{% set cloudflare = pillar['cloudflare'] %}
{% set ddns = pillar['ddns'] %}
{% set ddns_image = 'oznu/cloudflare-ddns:latest' %}

{{ ddns_image }}:
  docker_image.present:
    - force: true

cloudflare_ddns:
  docker_container.running:
    - image: {{ ddns_image }}
    - restart: 'unless-stopped'
    - environment:
      - EMAIL: {{ cloudflare['email'] }}
      - API_KEY: {{ cloudflare['api_key'] }}
      - ZONE: {{ ddns['zone'] }}
      - SUBDOMAIN: {{ ddns['subdomain'] }}
