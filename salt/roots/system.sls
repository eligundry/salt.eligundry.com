us_locale:
  locale.present:
    - name: en_US.UTF-8

default_locale:
  locale.system:
    - name: en_US.UTF-8

America/New_York:
  timezone.system:
    - utc: True

system_hostname:
  network.system:
    - hostname: '{{ pillar['hostname'] }}'
    - apply_hostname: True
    - retain_settings: True

apt_extensions:
  pkg.latest:
    - pkgs:
      - apt-transport-https
      - ca-certificates
      - curl
      - software-properties-common
