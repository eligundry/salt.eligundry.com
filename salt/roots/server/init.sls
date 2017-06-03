include:
  - server.website
  {% if grains['productname'] == 'Droplet' %}
  # - server.authy
  - server.digitalocean
  {% endif %}
