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

kitty:
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

# Debain doesn't include all the codecs for smooth video playback by default.
{% if grains['os'] == 'Debian' %}

debian-codecs:
  pkg.installed:
    - pkgs:
      - libavcodec-extra
      - x264

{% endif %}
