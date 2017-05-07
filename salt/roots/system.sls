us_locale:
  locale.present:
    - name: en_US.UTF-8

default_locale:
  locale.system:
    - name: en_US.UTF-8

America/New_York:
  timezone.system:
    - utc: True

/etc/hostname:
  file.managed:
    - contents_pillar: hostname
    - user: root
    - group: root
    - mode: 644
    - create: False

apt_extensions:
  pkg.latest:
    - pkgs:
      - apt-transport-https
      - ca-certificates
      - curl
      - software-properties-common
