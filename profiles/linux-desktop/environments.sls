audacious:
  pkg.installed:
    - pkgs:
      - audacious
      - audacious-plugins

clementine:
  pkg.installed

evince:
  pkg.installed

firefox:
  pkg.installed:
    {% if grains['os'] == 'Debian' %}
    - name: firefox-esr
    {% endif %}

fonts-linux:
  pkg.installed:
    - pkgs:
      - fonts-roboto
      - ttf-ancient-fonts
      - ttf-mscorefonts-installer

gimp:
  pkg.installed

gnome:
  pkg.installed

gnome-do:
  pkg.installed

mysql-workbench:
  pkg.installed

network-manager-openvpn:
  pkg.installed:
    - pkgs:
      - network-manager-openvpn
      - openvpn

qt4-qtconfig:
  pkg.installed

pgadmin3:
  pkg.installed:
    - pkgs:
      - pgadmin3
      - postgresql-client

peek:
  pkg.installed

redshift-gtk:
  pkg.installed

thunderbird:
  pkg.installed

transmission:
  pkg.installed

vlc:
  pkg.installed
