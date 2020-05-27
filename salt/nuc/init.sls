include:
  - nuc.salt-master
  # - nuc.salt-api
{% if grains['os'] == 'Debian' %}
  - nuc.drivers
  - nuc.egpu
  - nuc.nvidia-docker
{% endif %}
