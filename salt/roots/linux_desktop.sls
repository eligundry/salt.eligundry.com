{% set os = grains['os']|lower %}
{% set release = 'jessie' %}

desktop-environments:
  pkg.latest:
    - pkgs:
      - gnome
      - xfce4

desktop-pkgs:
  pkg.latest:
    - pkgs:
      - clementine
      - evince
      - firefox-esr
      - fonts-roboto
      - gimp
      - gnome-do
      - qt4-qtconfig
      - redshift-gtk
      - thunderbird
      - transmission
      - ttf-ancient-fonts
      - ttf-mscorefonts-installer
      - xfce4-goodies

empathy:
  pkg.purged

polari:
  pkg.purged

google-chrome-ppa:
  pkgrepo.managed:
    - humanname: Google Chrome
    - name: deb http://dl.google.com/linux/chrome/deb/ stable main
    - key_url: https://dl-ssl.google.com/linux/linux_signing_key.pub
    - file: /etc/apt/sources.list.d/google-chrome.list

google-chrome:
  pkg.latest:
    - pkgs:
      - google-chrome-beta
      - google-chrome-stable
      - google-chrome-unstable
      - chromium
    - require:
      - google-chrome-ppa

xfce4-dockbarx-ppa:
  pkgrepo.managed:
    - humanname: XFCE4 DockbarX Plugin
    - name: deb http://ppa.launchpad.net/dockbar-main/ppa/ubuntu zesty main
    - keyid: 38BD81CA
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/dockbarx.list

xfce4-dockbarx-plugin:
  pkg.latest:
    - require:
      - xfce4-dockbarx-ppa

spotify-ppa:
  pkgrepo.managed:
    - humanname: Spotify
    - name: deb http://repository.spotify.com stable non-free
    - keyid: BBEBDCB318AD50EC6865090613B00F1FD2C19886
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/spotify.list

spotify:
  pkg.latest:
    - name: spotify-client
    - require:
      - spotify-ppa

virtualbox-ppa:
  pkgrepo.managed:
    - humanname: VirtualBox
    - name: deb http://download.virtualbox.org/virtualbox/debian stretch non-free contrib
    - key_url: https://www.virtualbox.org/download/oracle_vbox_2016.asc
    - file: /etc/apt/sources.list.d/virtualbox.list

virtualbox:
  pkg.latest:
    - name: virtualbox-5.1
    - require:
      - virtualbox-ppa

numix-ppa:
  pkgrepo.managed:
    - humanname: Numix Icons
    - name: deb http://ppa.launchpad.net/numix/ppa/ubuntu zesty main
    - keyid: 0F164EEB
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/numix.list

numix:
  pkg.latest:
    - pkgs:
      - numix-icon-theme
      - numix-icon-theme-square
      - numix-gtk-theme
      - numix-folders
      - numix-icon-theme-circle
    - require:
      - numix-ppa

veracrypt-ppa:
  pkgrepo.managed:
    - humanname: VeraCrypt
    - name: deb http://ppa.launchpad.net/unit193/encryption/ubuntu zesty main
    - keyid: B58A653A
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/veracrypt.list

veracrypt:
  pkg.latest:
    - require:
      - veracrypt-ppa

emojione-ppa:
  pkgrepo.managed:
    - humanname: 'EmojiOne - Color Emoji Fonts'
    - name: deb http://ppa.launchpad.net/eosrei/fonts/ubuntu zesty main
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
  pkg.latest:
    - pkgs:
      - fonts-emojione-svginot
      - fonts-twemoji-svginot
      - emojione-picker
    - require:
      - emojione-ppa
      - emojione-picker-ppa

dropbox-ppa:
  pkgrepo.managed:
    - humanname: Dropbox
    - name: deb http://linux.dropbox.com/{{ os }}/ {{ release }} main
    - keyid: 5044912E
    - keyserver: pgp.mit.edu
    - file: /etc/apt/sources.list.d/dropbox.list

dropbox:
  pkg.latest:
    - require:
      - dropbox-ppa

discord:
  pkg.installed:
    - sources:
      - discord: 'https://discordapp.com/api/download?platform=linux&format=deb'
