{% set os = grains['os']|lower %}
{% set codename = grains['lsb_distrib_codename'] %}

dropbox-ppa:
  pkgrepo.managed:
    - humanname: Dropbox
    - name: deb http://linux.dropbox.com/{{ os }}/ {{ codename }} main
    - keyid: 5044912E
    - keyserver: pgp.mit.edu
    - file: /etc/apt/sources.list.d/dropbox.list

dropbox:
  pkg.installed:
    - require:
      - dropbox-ppa
