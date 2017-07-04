{% set codename = grains['lsb_distrib_codename'] %}

{% if grains['os'] == 'Debian' %}
  {% set codename = pillar['debian_ppa_codename'] %}
{% endif %}

veracrypt-ppa:
  pkgrepo.managed:
    - humanname: VeraCrypt
    - name: deb http://ppa.launchpad.net/unit193/encryption/ubuntu {{ codename }} main
    - keyid: B58A653A
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/veracrypt.list

veracrypt:
  pkg.latest:
    - require:
      - veracrypt-ppa
