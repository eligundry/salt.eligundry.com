{% if grains['kernel'] == 'Linux' %}

{% set codename = grains['lsb_distrib_codename'] %}

{% if grains['os'] == 'Debian' %}
  {% set codename = pillar['debian_ppa_codename'] %}
{% endif %}

neovim-ppa:
  pkgrepo.managed:
    - humanname: Neovim
    - name: deb http://ppa.launchpad.net/neovim-ppa/unstable/ubuntu {{ codename }} main
    - keyid: 8231B6DD
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/neovim.list
    - clean_file: true

{% endif %}

neovim:
  pkg.installed

npm-languageserver-pkgs:
  npm.installed:
    - pkgs:
      - neovim
      - vscode-css-languageserver-bin
      - javascript-typescript-langserver
      - dockerfile-language-server-nodejs
      - tslint
      - typescript
    - force_reinstall: true

python-language-server:
  pip.installed:
    - name: python-language-server[all]
