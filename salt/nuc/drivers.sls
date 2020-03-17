intel-microcode:
  pkg.installed

intel-wireless:
  pkg.installed:
    - name: firmware-iwlwifi

bluetooth:
  pkg.installed:
    - pkgs:
      - bluez-firmware
      - blueman

firmware-misc-nonfree:
  pkg.installed
