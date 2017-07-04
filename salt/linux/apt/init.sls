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

periodic-unattended-upgrades:
  file.managed:
    - name: /etc/apt/apt.conf.d/02periodic
    - source: salt://linux/apt/periodic-upgrades
    - user: root
    - group: root
    - mode: 644
    - require:
      - unattended-upgrades
