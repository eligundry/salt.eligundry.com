include:
  - shared.user

{% set user = pillar['user']['name'] %}
{% set home = pillar['user']['home'] %}

awscli:
  pkg.installed

{{ home }}/.aws/credentials:
  file.managed:
    - user: {{ user }}
    - mode: 600
    - template: jinja
    - source: salt://shared/aws/credentials
    - makedirs: true
    - show_changes: false
    - require:
      - {{ user }}

{{ home }}/.aws/config:
  file.managed:
    - user: {{ user }}
    - mode: 600
    - template: jinja
    - source: salt://shared/aws/config
    - makedirs: true
    - require:
      - {{ user }}
