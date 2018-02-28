{% set home = pillar['user']['home'] %}
{% set code = home + '/Code' %}
{% set user = pillar['user']['name'] %}
{% set work_machine = pillar['work_machine'] %}

{{ code }}:
  file.directory:
    - user: {{ user }}

{% for target, config in pillar['repos'].items() %}

{% if work_machine %}

{{ config['git'] }}:
  git.latest:
    - target: {{ code }}/{{ target }}
    - user: {{ user }}
    - identity: {{ home }}/.ssh/no_pass
    - unless: 'test -d {{ code }}/{{ target }}'
    - require:
      - git
      - {{ home }}/.ssh/no_pass
      - {{ code }}

{% else %}

{{ config['git'] }}:
  file.absent:
    - name: {{ code }}/{{ target }}

{% endif %}

{% endfor %}

# Generate host entries for the web apps I am working on.
{% for host, ip in pillar['hosts'].items() %}

host-{{ host }}:
  {% if work_machine %}
  host.present:
  {% else %}
  host.absent:
  {% endif %}
    - name: {{ host }}
    - ip: {{ ip }}

{% endfor %}
