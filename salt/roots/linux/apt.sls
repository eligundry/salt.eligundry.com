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
