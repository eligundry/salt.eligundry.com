{% if grains['osfullname'] == 'Debian' %}

nvidia-driver:
  pkg.installed

{% endif %}

/etc/X11/xorg.conf.egpu:
  file.managed:
    - source: salt://nuc/egpu/xorg.conf
    - user: root
    - group: root
    - makedirs: true

# https://egpu.io/forums/thunderbolt-linux-setup/a-script-to-change-xorg-config/
# After setting up, run:
# sudo gswitch egpu
gswitch-ppa:
  pkgrepo.managed:
    - humanname: gswitch - app to switch between external and internal GPUs
    - name: deb http://ppa.launchpad.net/karli.sjoberg/gswitch-ppa/ubuntu bionic main 
    - key_url: 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x726bf3a7629e9884685cb7dfba8af6042cf73d92'
    - file: /etc/apt/sources.list.d/gswitch.list

gswitch-gui:
  pkg.installed:
    - require:
      - gswitch-ppa
