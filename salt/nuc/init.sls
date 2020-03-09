include:
{% if grains['os'] == 'Debian' %}
  - nuc.drivers
  - nuc.egpu
  - nuc.nvidia-docker
{% endif %}
