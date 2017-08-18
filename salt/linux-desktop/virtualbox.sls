{% set codename = grains['lsb_distrib_codename'] %}

{% if codename == 'buster' %}
  {% set codename = 'stretch' %}
{% endif %}

virtualbox-ppa:
  pkgrepo.managed:
    - humanname: VirtualBox
    - name: deb http://download.virtualbox.org/virtualbox/debian {{ codename }} non-free contrib
    - key_url: https://www.virtualbox.org/download/oracle_vbox_2016.asc
    - file: /etc/apt/sources.list.d/virtualbox.list

virtualbox:
  pkg.latest:
    - name: virtualbox-5.1
    - require:
      - virtualbox-ppa
