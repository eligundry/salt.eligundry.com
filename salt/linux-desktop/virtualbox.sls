{% set codename = grains['lsb_distrib_codename'] %}
{% set apt_source = 'deb http://download.virtualbox.org/virtualbox/debian ' + codename + ' non-free contrib' %}
{% set package_name = 'virtualbox-6.1' %}

{% if codename == 'bullseye' or codename == 'sid' %}
  {% set apt_source = 'deb http://httpredir.debian.org/debian/ sid main contrib non-free' %}
  {% set package_name = 'virtualbox' %}
{% endif %}


virtualbox-ppa:
  pkgrepo.managed:
    - humanname: VirtualBox
    - name: {{ apt_source }}
    - key_url: https://www.virtualbox.org/download/oracle_vbox_2016.asc
    - file: /etc/apt/sources.list.d/virtualbox.list

virtualbox:
  pkg.installed:
    - name: {{ package_name }}
    - require:
      - virtualbox-ppa
