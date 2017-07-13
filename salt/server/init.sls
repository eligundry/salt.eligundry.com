include:
  - server.website
  # - server.paranoia
  - server.openvpn
  {% if grains['productname'] == 'Droplet' %}
  # - server.authy
  - server.digitalocean
  {% endif %}
