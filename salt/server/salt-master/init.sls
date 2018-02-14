salt-master:
  pkg.installed

/etc/salt/master:
  file.managed:
    - source: salt://server/salt-master/master.sls
    - user: root
    - group: root
    - mode: 600

salt-master-service:
  service.running:
    - name: salt-master
    - enable: true
    - watch:
      - file: /etc/salt/master
    - require:
      - /etc/salt/master
