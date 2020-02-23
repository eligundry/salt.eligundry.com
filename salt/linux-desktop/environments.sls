audacious:
  pkg.installed:
    - pkgs:
      - audacious
      - audacious-plugins

clementine:
  pkg.installed

evince:
  pkg.installed

gimp:
  pkg.installed

gnome:
  pkg.installed

network-manager-openvpn:
  pkg.installed:
    - pkgs:
      - network-manager-openvpn
      - openvpn

qt4-qtconfig:
  pkg.installed

peek:
  pkg.installed

thunderbird:
  pkg.installed

transmission:
  pkg.installed

vlc:
  pkg.installed
