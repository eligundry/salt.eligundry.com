salt-master:
  pkg.installed

/etc/salt/master:
  file.managed:
    - source: salt://server/salt-master/master.sls
    - user: root
    - group: root
    - mode: 660

salt-master-service:
  service.running:
    - name: salt-master
    - enable: true
    - watch:
      - file: /etc/salt/master
