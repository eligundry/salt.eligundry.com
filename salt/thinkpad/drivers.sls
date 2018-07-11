thinkpad-firmware:
  pkg.installed:
    - name: tp-smapi-dkms

{% if grains['os'] == 'Debian' %}
intel-wireless:
  pkg.installed:
    - name: firmware-iwlwifi

bluetooth:
  pkg.installed:
    - pkgs:
      - bluez-firmware
{% endif %}
