include:
{% if grains['os'] == 'Debian' %}
  - nuc.drivers
  - nuc.egpu
{% endif %}
