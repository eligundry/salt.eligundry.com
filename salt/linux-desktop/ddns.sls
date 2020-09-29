# Setup DDNS for my apartment using Cloudflare
# 
# 2020-09-29: I'm deprecating this in favor of using private IPs provided by
# TailScale. The big issue with these startes is that the IP address will be
# wrong when I connect to my work VPN, they don't update accurately, and overall
# having public DNS for this is a bad idea.

{% set ddns = pillar['ddns'] %}
{% set ddns_image = 'oznu/cloudflare-ddns:latest' %}

# {{ ddns_image }}:
#   docker_image.present:
#     - force: true

{{ ddns_image }}:
  docker_image.absent:
    - force: true

{% for entry in ddns %}

# 'ddns-{{ entry['rrtype'] }}-{{ entry['subdomain'] }}.{{ entry['zone'] }}':
#   docker_container.running:
#     - image: {{ ddns_image }}
#     - restart: 'unless-stopped'
#     - environment:
#       - API_KEY: {{ entry['api_key'] }}
#       - ZONE: {{ entry['zone'] }}
#       - SUBDOMAIN: {{ entry['subdomain'] }}
#       - RRTYPE: {{ entry['rrtype'] }}

'ddns-{{ entry['rrtype'] }}-{{ entry['subdomain'] }}.{{ entry['zone'] }}':
  docker_container.absent

{% endfor %}
