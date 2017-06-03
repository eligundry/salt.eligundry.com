include:
  - server.website
  {% if grains['productname'] == 'Droplet' %}
  - server.digitalocean
  {% endif %}
