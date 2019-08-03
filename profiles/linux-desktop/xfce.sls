xfce4:
  pkg.installed:
    - pkgs:
      - xfce4
      - xfce4-goodies

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
