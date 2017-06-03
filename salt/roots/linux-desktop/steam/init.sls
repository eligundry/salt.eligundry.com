steam:
  pkg.installed:
    - sources:
      - steam-launcher: "https://steamcdn-a.akamaihd.net/client/installer/steam.deb"

steam-controller:
  file.managed:
    - name: /lib/udev/rules.d/99-steam-controller-perms.rules
    - source: salt://linux-desktop/steam/99-steam-controller-perms.rules
    - user: root
    - group: root
    - mode: 644
