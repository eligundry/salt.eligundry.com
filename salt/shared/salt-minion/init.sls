{% set group = 'root' %}

{% if grains['os'] == 'MacOS' %}

salt-minion:
  pkg.installed:
    - name: saltstack

{% set group = 'wheel' %}

{% else %}

{% set os = grains['os'].lower() %}
{% set release = grains['osrelease'] %}
{% set arch = grains['osarch'] %}
{% set codename = grains['oscodename'] %}

{% if codename == 'buster' %}
  {% set codename = 'stretch' %}
  {% set release = '9' %}
{% endif %}

saltstack-ppa:
  pkgrepo.managed:
    - humanname: SaltStack
    - name: deb https://repo.saltstack.com/apt/{{ os }}/{{ release }}/{{ arch }}/latest {{ codename }} main
    - keyfile: https://repo.saltstack.com/apt/{{ os }}/{{ release }}/{{ arch }}/latest/SALTSTACK-GPG-KEY.pub
    - file: /etc/apt/sources.list.d/saltstack.list
    - clean_file: true

salt-minion:
  pkg.installed:
    - require:
      - saltstack-ppa

salt-minion-service:
  service.running:
    - name: salt-minion
    - enable: true
    - watch:
      - file: /etc/salt/minion
    - require:
      - /etc/salt/minion
      - salt-minion

{% endif %}

/etc/salt/minion:
  file.managed:
    - source: salt://shared/salt-minion/minion.sls
    - user: root
    - group: root
    - mode: 660
    - template: jinja
    - defaults:
        salt_master: {{ salt['pillar.get']('salt-master:host') }}
        salt_master_fingerprint: {{ salt['pillar.get']('salt-master:fingerprint') }}
