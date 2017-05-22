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
