salt-master:
  pkg.installed

/etc/salt/master.d/overrides.conf:
  file.managed:
    - source: salt://server/salt-master/master.sls
    - user: root
    - group: root
    - mode: 660
    - template: jinja
    - defaults:
        salt_master: {{ pillar['salt-master'] }}
        eligundry_branch: {{ pillar['salt-master']['branch'] }}

/etc/salt/master:
  file.managed:
    - source: https://raw.githubusercontent.com/saltstack/salt/master/conf/master
    - replace: true
    - skip_verify: true
    - user: root

salt-master-service:
  service.running:
    - name: salt-master
    - enable: true
    - watch:
      - file: /etc/salt/master
      - file: /etc/salt/master.d/overrides.conf
