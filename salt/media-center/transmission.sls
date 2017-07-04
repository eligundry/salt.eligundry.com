transmission-daemon:
  pkg.installed

transmission-daemon-service:
  service.running:
    - name: transmission-daemon
    - enable: True
    - require:
      - pkg: transmission-daemon
