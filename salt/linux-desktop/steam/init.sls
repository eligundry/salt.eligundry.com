add-i386-architecture:
  cmd.run:
    - name: dpkg --add-architecture i386
    - unless: dpkg --print-foreign-architectures | grep i386
    - comment: Enable 32 bit packages for ZSNES and Steam.

steam-deps:
  pkg.installed:
    - pkgs:
      - libc6-i386
    - require:
      - add-i386-architecture

steam:
  pkg.installed:
    - sources:
      - steam-launcher: "https://steamcdn-a.akamaihd.net/client/installer/steam.deb"
    - require:
      - steam-deps

steam-controller:
  file.managed:
    - name: /lib/udev/rules.d/99-steam-controller-perms.rules
    - source: salt://linux-desktop/steam/99-steam-controller-perms.rules
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
      group: {{ pillar['user']['name'] }}
