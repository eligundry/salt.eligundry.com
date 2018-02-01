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

/etc/apt/apt.conf.d/02periodic:
  file.managed:
    - source: salt://linux/apt/periodic-upgrades
    - user: root
    - group: root
    - mode: 644
    - require:
      - unattended-upgrades

/etc/apt/apt.conf.d/50unattended-upgrades:
  file.managed:
    - source: salt://linux/apt/periodic-upgrades
    - user: root
    - group: root
    - mode: 644
    - require:
      - unattended-upgrades
