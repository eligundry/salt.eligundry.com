{% set codename = grains['lsb_distrib_codename'] %}

{% if codename == 'bullseye' %}
  {% set codename = 'buster' %}
{% endif %}

node-ppa:
  pkgrepo.managed:
    - humanname: Node.js
    - name: deb https://deb.nodesource.com/node_14.x {{ codename }} main
    - key_url: https://deb.nodesource.com/gpgkey/nodesource.gpg.key
    - file: /etc/apt/sources.list.d/nodejs.list
    - clean_file: true

nodejs:
  pkg.installed:
    - require:
      - node-ppa
