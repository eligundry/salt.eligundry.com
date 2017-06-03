apt-extensions:
  pkg.latest:
    - pkgs:
      - apt-transport-https
      - ca-certificates
      - curl
      - software-properties-common

unattended-upgrades:
  pkg.installed:
    - pkgs:
      - apt-listchanges
      - unattended-upgrades

{% if grains['os'] == 'Debian' %}
debian-sources:
  file.managed:
    - name: /etc/apt/sources.list
    - source: salt://linux/apt/debian-sources.list
    - user: root
    - group: root
    - mode: 644
{% endif %}
