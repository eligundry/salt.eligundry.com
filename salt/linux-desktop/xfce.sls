xfce4:
  pkg.installed:
    - pkgs:
      - xfce4
      - xfce4-goodies

xfce4-dockbarx-ppa:
  pkgrepo.managed:
    - humanname: XFCE4 DockbarX Plugin
    - name: deb http://ppa.launchpad.net/xuzhen666/dockbarx/ubuntu bionic main 
    - key_url: 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x77d026e2eead66bd'
    - file: /etc/apt/sources.list.d/dockbarx.list

xfce4-dockbarx-plugin:
  pkg.latest:
    - require:
      - xfce4-dockbarx-ppa
