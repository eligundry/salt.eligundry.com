desktop_environments:
  pkg.latest:
    - pkgs:
      - gnome
      - xfce4

desktop_pkgs:
  pkg.latest:
    - pkgs:
      - clementine
      - evince
      - firefox-esr
      - fonts-roboto
      - gimp
      - redshift-gtk
      - thunderbird
      - transmission
      - ttf-mscorefonts-installer
      - xfce4-goodies

google_chrome:
  pkgrepo.managed:
    - humanname: Google Chrome
    - name: deb http://dl.google.com/linux/chrome/deb/ stable main
    - key_url: https://dl-ssl.google.com/linux/linux_signing_key.pub
    - file: /etc/apt/sources.list.d/google-chrome.list
  pkg.latest:
    - pkgs:
      - google-chrome-beta
      - google-chrome-stable
      - google-chrome-unstable
      - chromium

xfce4-dockbarx:
  pkgrepo.managed:
    - humanname: XFCE4 DockbarX Plugin
    - name: deb http://ppa.launchpad.net/dockbar-main/ppa/ubuntu zesty main
    - keyid: 38BD81CA
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/dockbarx.list
  pkg.latest:
    - name: xfce4-dockbarx-plugin

spotify:
  pkgrepo.managed:
    - humanname: Spotify
    - name: deb http://repository.spotify.com stable non-free
    - keyid: BBEBDCB318AD50EC6865090613B00F1FD2C19886
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/spotify.list
  pkg.latest:
    - name: spotify-client

virtualbox:
  pkgrepo.managed:
    - humanname: VirtualBox
    - name: deb http://download.virtualbox.org/virtualbox/debian stretch non-free contrib
    - key_url: https://www.virtualbox.org/download/oracle_vbox_2016.asc
    - file: /etc/apt/sources.list.d/virtualbox.list
  pkg.latest:
    - name: virtualbox-5.1

numix:
  pkgrepo.managed:
    - humanname: Numix Icons
    - name: deb http://ppa.launchpad.net/numix/ppa/ubuntu zesty main
    - keyid: 0F164EEB
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/numix.list
  pkg.latest:
    - pkgs:
      - numix-icon-theme
      - numix-icon-theme-square
      - numix-gtk-theme
      - numix-folders
      - numix-icon-theme-circle

veracrypt:
  pkgrepo.managed:
    - humanname: VeraCrypt
    - name: deb http://ppa.launchpad.net/unit193/encryption/ubuntu zesty main
    - keyid: B58A653A
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/veracrypt.list
  pkg.latest:
    - name: veracrypt
