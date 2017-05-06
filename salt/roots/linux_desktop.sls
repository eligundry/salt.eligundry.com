desktop_environments:
  pkg.latest:
    - pkgs:
      - gnome
      - xfce4
      - xfce4-whiskermenu-plugin

desktop_pkgs:
  pkg.latest:
    - pkgs:
      - redshift-gtk

google_chrome:
  pkgrepo.managed:
    - humanname: Google Chrome
    - name: deb http://dl.google.com/linux/chrome/deb/ stable main
    - dist: stable
    - file: /etc/apt/sources.list.d/chrome-browser.list
    - require_in:
      - pkg: google-chrome-stable
    - gpgcheck: 1
    - key_url: https://dl-ssl.google.com/linux/linux_signing_key.pub
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
    - dist: zesty
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
