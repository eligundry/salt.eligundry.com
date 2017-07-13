transmission-daemon:
  pkg.installed

/var/lib/transmission/settings.json:
  file.managed:
    - source: salt://media-center/transmission/settings.json
    - user: debian-transmission
    - group: debian-transmission
    - mode: 600
    - makedirs: True
    - template: jinja
    - require:
      - pkg: transmission-daemon

/lib/systemd/system/transmission-daemon.service:
  file.line:
    - content: "ExecStart=/usr/bin/transmission-daemon -f --log-error -g /var/lib/transmission"
    - match: ExecStart=
    - mode: replace

debian-transmission:
  user.present:
    - createhome: False
    - groups:
      - debian-transmission
      - users

transmission-daemon-service:
  service.running:
    - name: transmission-daemon
    - enable: True
    - watch:
      - file: /var/lib/transmission/settings.json
      - file: /lib/systemd/system/transmission-daemon.service
    - require:
      - pkg: transmission-daemon
