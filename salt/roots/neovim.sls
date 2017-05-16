neovim-ppa:
  pkgrepo.managed:
    - humanname: Neovim
    - name: deb http://ppa.launchpad.net/neovim-ppa/unstable/ubuntu zesty main
    - keyid: 8231B6DD
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/neovim.list

neovim:
  pkg.latest:
    - require:
      - neovim-ppa
