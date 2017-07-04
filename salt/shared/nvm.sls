{% set user = pillar['user']['name'] %}
{% set home = pillar['user']['home'] %}

nvm-repo:
  git.latest:
    - name: https://github.com/creationix/nvm.git
    - target: {{ home }}/.nvm
    - user: {{ user }}
    - require:
      - {{ user }}

nvm-lts:
  cmd.run:
    - comment: "Install the latest Node LTS version"
    - name: 'source {{ home }}/dots/commonprofile && nvm install --lts'
    - unless: 'source {{ home }}/dots/commonprofile && nvm use --lts'
    - runas: {{ user }}
    - cwd: {{ home }}
    - require:
      - nvm-repo
      - dots-repo
