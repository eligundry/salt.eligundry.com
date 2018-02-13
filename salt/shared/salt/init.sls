salt-minion:
  pkg.installed:
    {% if grains['os'] == 'MacOS' %}
    - name: saltstack
    {% else %}
    - name: salt-minion
    {% endif %}

/etc/salt/minion:
  file.managed:
    - source: salt://linux/salt/minion.sls
    - user: root
    - group: root
    - mode: 600
    - template: jinja
    - defaults:
      - master_host: {{ salt['pillar.get']('salt-master:host') }}
    - require:
      - salt-minion
