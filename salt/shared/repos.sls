{% set home = pillar['user']['home'] %}
{% set code = home + '/Code' %}
{% set user = pillar['user']['name'] %}

{{ code }}:
  file.directory:
    - user: {{ user }}

{% for target, config in pillar['repos'].items() %}

{{ config['git'] }}:
  git.latest:
    - target: {{ code }}/{{ target }}
    - user: {{ user }}
    - identity: {{ home }}/.ssh/no_pass
    - onlyif: 'test ! -d {{ code }}/{{ target }}'
    - require:
      - git
      - {{ home }}/.ssh/no_pass
      - {{ code }}

{% endfor %}

# Generate host entries for the web apps I am working on.
{% for host, ip in pillar['hosts'].items() %}

host-{{ host }}:
  host.present:
    - name: {{ host }}
    - ip: {{ ip }}

{% endfor %}
