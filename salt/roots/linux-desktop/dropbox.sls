{% set os = grains['os']|lower %}
{% set codename = grains['lsb_distrib_codename'] %}

# Dropbox doesn't provide a release for stretch, so fallback to Jessie
{% if codename == 'stretch' %}
  {% set codename = 'jessie' %}
{% endif %}

dropbox-ppa:
  pkgrepo.managed:
    - humanname: Dropbox
    - name: deb http://linux.dropbox.com/{{ os }}/ {{ codename }} main
    - keyid: 5044912E
    - keyserver: pgp.mit.edu
    - file: /etc/apt/sources.list.d/dropbox.list

dropbox:
  pkg.latest:
    - require:
      - dropbox-ppa
