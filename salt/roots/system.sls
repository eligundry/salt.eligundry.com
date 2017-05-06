us_locale:
  locale.present:
    - name: en_US.UTF-8

default_locale:
  locale.system:
    - name: en_US.UTF-8

apt_extensions:
  pkg.latest:
    - pkgs:
      - apt-transport-https
