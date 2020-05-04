# This is being annoying
# {% set os = grains['os']|lower %}
# {% set codename = grains['lsb_distrib_codename'] %}
#
# {% if codename == 'bullseye' %}
#   {% set codename = 'buster' %}
# {% endif %}
#
# dropbox-ppa:
#   pkgrepo.managed:
#     - humanname: Dropbox
#     - name: deb http://linux.dropbox.com/{{ os }}/ {{ codename }} main
#     - keyid: 5044912E
#     - keyserver: pgp.mit.edu
#     - file: /etc/apt/sources.list.d/dropbox.list
#
# dropbox:
#   pkg.installed:
#     - require:
#       - dropbox-ppa

{% set version = '2020.03.04' %}

/etc/apt/sources.list.d/dropbox.list:
  file.absent

dropbox:
  pkg.installed:
    - sources:
      - dropbox: https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_{{ version}}_amd64.deb
