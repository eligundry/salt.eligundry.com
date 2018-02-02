include:
  - server.salt-cloud
  - server.website
  - server.pi-hole
  - server.openvpn
  {% if grains['productname'] == 'Droplet' %}
  # - server.authy
  - server.digitalocean
  {% endif %}
