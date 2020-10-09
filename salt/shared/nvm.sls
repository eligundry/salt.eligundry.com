{% set user = pillar['user']['name'] %}
{% set home = pillar['user']['home'] %}

nvm-repo:
  git.latest:
    - name: https://github.com/creationix/nvm.git
    - target: {{ home }}/.nvm
    - user: {{ user }}
    - identity: {{ home }}/.ssh/no_pass
    - require:
      - {{ user }}
