intel-microcode:
  pkg.installed

intel-wireless:
  pkg.installed:
    - name: firmware-iwlwifi

bluetooth:
  pkg.installed:
    - pkgs:
      - bluez-firmware

firmware-misc-nonfree:
  pkg.installed
