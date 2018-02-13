{% set codename = grains['lsb_distrib_codename'] %}

{% if grains['os'] == 'Debian' %}
  {% set codename = pillar['debian_ppa_codename'] %}
{% endif %}

emojione-ppa:
  pkgrepo.managed:
    - humanname: 'EmojiOne - Color Emoji Fonts'
    - name: deb http://ppa.launchpad.net/eosrei/fonts/ubuntu {{ codename }} main
    - keyid: 62D7EDF8
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/emojione.list

emojione-picker-ppa:
  pkgrepo.managed:
    - humanname: EmojiOne Picker
    - name: deb http://ppa.launchpad.net/ys/emojione-picker/ubuntu xenial main
    - keyid: EC2F4EE0
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/emojione-picker.list

emojione:
  pkg.installed:
    - pkgs:
      - fonts-emojione-svginot
      - fonts-twemoji-svginot
      - emojione-picker
    - require:
      - emojione-ppa
      - emojione-picker-ppa
