include:
  - server.salt-master
  - server.salt-cloud
  - server.salt-master
  - server.salt-api
{% if grains['os'] == 'Debian' %}
  - nuc.drivers
  - nuc.egpu
  - nuc.nvidia-docker
{% endif %}
