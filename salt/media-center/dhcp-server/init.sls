isc-dhcp-server:
  pkg.installed

/etc/default/isc-dhcp-server:
  file.managed:
    - source: salt://media-center/dhcp-server/isc-dhcp-server
    - user: root
    - group: root
    - mode: 644
    - makedirs: True

/etc/dhcp/dhcpd.conf:
  file.managed:
    - source: salt://media-center/dhcp-server/dhcpd.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
        domain: {{ pillar['dhcp']['domain'] }}
        base: {{ pillar['dhcp']['base'] }}

isc-dhcp-server-service:
  service.running:
    - name: isc-dhcp-server
    - enabled: True
    - watch:
      - file: /etc/dhcp/dhcpd.conf
      - file: /etc/default/isc-dhcp-server
    - require:
      - isc-dhcp-server
