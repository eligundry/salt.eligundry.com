{% set home = pillar['user']['home'] %}
{% set code = home + '/Code' %}
{% set user = pillar['user']['name'] %}

{{ code }}:
  file.directory:
    - user: {{ user }}

{% for target, repo in pillar['repos'].items() %}
{{ repo }}:
  git.latest:
    - target: {{ code }}/{{ target }}
    - user: {{ user }}
    - identity: {{ home }}/.ssh/no_pass
    - onlyif: 'test ! -d {{ code }}/{{ target }}'
    - require:
      - git
      - {{ home }}/.ssh/no_pass
{% endfor %}

# Generate host entries for the web apps I am working on.
{% for host, ip in pillar['hosts'].items() %}
host-{{ host }}:
  host.present:
    - name: {{ host }}
    - ip: {{ ip }}
{% endfor %}
