salt-master:
  pkg.installed

# /etc/salt/master:
#   file.managed:
#     - source: salt://nuc/salt-master/master.sls
#     - user: root
#     - group: root
#     - mode: 660
#     - template: jinja
#     - defaults:
#         salt_master: {{ pillar['salt-master'] }}
#         eligundry_branch: {{ pillar['salt-master']['branch'] }}
#
# salt-master-service:
#   service.running:
#     - name: salt-master
#     - enable: true
#     - watch:
#       - file: /etc/salt/master
