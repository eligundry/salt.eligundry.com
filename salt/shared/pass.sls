{% set home = pillar['user']['home'] %}

pass:
  pkg.installed

{{ pillar['user']['pass'] }}:
  git.latest:
    - target: {{ home }}/.password-store
    - user: {{ pillar['user']['name'] }}
    - identity: {{ home }}/.ssh/no_pass
    - require:
      - git
      - {{ home }}/.ssh/no_pass
