salt-master:
  pkg.installed

/etc/salt/master:
  file.managed:
    - source: salt://server/salt-master/master.sls
    - user: root
    - group: root
    - mode: 600
