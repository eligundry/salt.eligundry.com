{% set codename = grains['lsb_distrib_codename'] %}

google-cloud-sdk-ppa:
  pkgrepo.managed:
    - humanname: Google Cloud SDK
    - name: deb https://packages.cloud.google.com/apt cloud-sdk-{{ codename }} main
    - key_url: https://packages.cloud.google.com/apt/doc/apt-key.gpg
    - file: /etc/apt/sources.list.d/google-cloud-skd.list

google-cloud-sdk:
  pkg.installed:
    - pkgs:
      - google-cloud-sdk
      - google-cloud-sdk-app-engine-python
      - kubectl
    - require:
      - google-cloud-sdk-ppa
