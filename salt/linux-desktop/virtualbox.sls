{% set codename = grains['lsb_distrib_codename'] %}

{% if codename == 'bullseye' %}
  {% set codename = 'buster' %}
{% endif %}

virtualbox-ppa:
  pkgrepo.managed:
    - humanname: VirtualBox
    - name: deb http://download.virtualbox.org/virtualbox/debian {{ codename }} non-free contrib
    - key_url: https://www.virtualbox.org/download/oracle_vbox_2016.asc
    - file: /etc/apt/sources.list.d/virtualbox.list

virtualbox:
  pkg.installed:
    - name: virtualbox-6.1
    - require:
      - virtualbox-ppa
