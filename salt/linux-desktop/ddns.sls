# Setup DDNS for my apartment using Cloudflare

{% set ddns = pillar['ddns'] %}
{% set ddns_image = 'oznu/cloudflare-ddns:latest' %}

{{ ddns_image }}:
  docker_image.present:
    - force: true

{% for entry in ddns %}

'ddns-{{ entry['rrtype'] }}-{{ entry['subdomain'] }}.{{ entry['zone'] }}':
  docker_container.running:
    - image: {{ ddns_image }}
    - restart: 'unless-stopped'
    - environment:
      - API_KEY: {{ entry['api_key'] }}
      - ZONE: {{ entry['zone'] }}
      - SUBDOMAIN: {{ entry['subdomain'] }}
      - RRTYPE: {{ entry['rrtype'] }}

{% endfor %}
