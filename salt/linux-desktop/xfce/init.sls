{% set user = pillar['user']['name'] %}

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

xfce4-customize:
  cmd.run:
    - name: /srv/salt/linux-desktop/xfce/customize-xfce.sh
    - runas: {{ user }}
    - cwd: /home/{{ user }}
    - require:
      - {{ user }}
