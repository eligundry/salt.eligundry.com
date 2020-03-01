{% if grains['os'] == 'Debian' %}

intel-microcode:
  pkg.installed

intel-wireless:
  pkg.installed:
    - name: firmware-iwlwifi

bluetooth:
  pkg.installed:
    - pkgs:
      - bluez-firmware

nvidia-driver:
  pkg.installed

{% endif %}
