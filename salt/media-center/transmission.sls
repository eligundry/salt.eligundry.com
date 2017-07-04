transmission-daemon:
  pkg.installed

transmission-daemon-service:
  service.running:
    - enable: True
    - require:
      - transmission-daemon
