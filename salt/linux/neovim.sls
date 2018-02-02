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

neovim:
  pkg.latest:
    - require:
      - neovim-ppa
