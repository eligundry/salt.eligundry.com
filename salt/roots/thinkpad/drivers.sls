thinkpad-firmware:
  pkg.latest:
    - name: tp-smapi-dkms

{% if grains['os'] == 'Debian' %}
intel-wireless:
  pkg.latest:
    - name: firmware-iwlwifi
{% endif %}
