include:
{% if grains['os'] == 'Debian' %}
  - nuc.drivers
  # - nuc.nvidia
{% endif %}
