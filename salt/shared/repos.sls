include:
  - shared.cli
  - shared.user

{% set home = pillar['user']['home'] %}
{% set code = home + '/Code' %}
{% set user = pillar['user']['name'] %}

{{ code }}:
  file.directory:
    - user: {{ user }}

{% for target, config in pillar.get('repos', {}).items() %}

{{ config['git'] }}:
  git.latest:
    - target: {{ code }}/{{ target }}
    {% if grains['os'] != 'MacOS' %}
    - user: {{ user }}
    {% endif %}
    - identity: {{ home }}/.ssh/no_pass
    - unless: 'test -d {{ code }}/{{ target }}'
    - require:
      - git
      - {{ home }}/.ssh/no_pass
      - {{ code }}

{% endfor %}

# Generate host entries for the web apps I am working on.
{% for host, ip in pillar.get('hosts', {}).items() %}

host-{{ host }}:
  host.present:
    - name: {{ host }}
    - ip: {{ ip }}

{% endfor %}
