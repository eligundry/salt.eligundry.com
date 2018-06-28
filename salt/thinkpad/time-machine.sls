# I want to use the spinning HDD in my Thinkpad as a Time Machine Backup

{% set tm = pillar['time-machine'] %}
{% set tm_image = 'odarriba/timemachine' %}

avahi-daemon:
  pkg.installed

/etc/avahi/services/afpd.service:
  file.managed:
    - source: https://raw.githubusercontent.com/odarriba/docker-timemachine/master/avahi/afpd.service
    - user: root
    - group: root
    - skip_verify: true

{{ tm['dir'] }}:
  file.directory:
    - user: docker
    - group: docker
    - dir_mode: 755
    - file_mode: 644

{{ tm_image }}:
  docker_image.present:
    - force: true

time-machine:
  docker_container.running:
    - image: {{ tm_image }}
    - hostname: time-machine
    - environment:
      - AFP_LOGIN: {{ tm['user'] }}
      - AFP_PASSWORD: {{ tm['password'] }}
      - AFP_NAME: {{ tm['name'] }}
      - AFP_SIZE_LIMIT: {{ tm['max_size'] }}
    - binds:
      - {{ tm['dir'] }}:/timemachine
    - port_bindings:
      - "548:548"
      - "636:636"
