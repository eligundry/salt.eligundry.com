{% set os = grains['os'] %}

{% if os != 'Debian' %}
kodi-ppa:
  pkgrepo.managed:
    - humanname: Kodi Media Center
    - name: deb http://ppa.launchpad.net/team-xbmc/ppa/ubuntu zesty main
    - keyid: 91E7EE5E
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/kodi.list
{% endif %}

kodi:
  pkg.installed:
    - pkgs:
      - kodi
      - kodi-addons-dev
      - kodi-pvr-hts
    {% if os != 'Debian' %}
    - require:
      - kodi-ppa
    {% endif %}

hauppage-wintv-hvr-950q-driver:
  pkg.installed:
    - name: firmware-linux-nonfree

tvheadend-ppa:
  pkgrepo.managed:
    - humanname: Tvheadend
    - name: deb https://dl.bintray.com/tvheadend/deb jessie stable-4.2
    - keyid: 379CE192D401AB61
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/tvheadend.list

tvheadend:
  pkg.installed:
    - require:
      - tvheadend-ppa
