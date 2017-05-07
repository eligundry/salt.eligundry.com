{% set user = pillar['user']['name'] %}
{% set pyenv_path = '/home/' + user + '/.pyenv' %}

pyenv:
  git.latest:
    - name: https://github.com/pyenv/pyenv.git
    - target: {{ pyenv_path }}
    - user: {{ user }}

pyenv-default-packages:
  git.latest:
    - name: https://github.com/jawshooah/pyenv-default-packages.git
    - target: {{ pyenv_path }}/plugins/pyenv-default-packages
    - user: {{ user }}
    - require:
      - pyenv

pyenv-implicit:
  git.latest:
    - name: https://github.com/concordusapps/pyenv-implict.git
    - target: {{ pyenv_path }}/plugins/pyenv-implict
    - user: {{ user }}
    - require:
      - pyenv

pyenv-virtualenv:
  git.latest:
    - name:  https://github.com/pyenv/pyenv-virtualenv.git
    - target: {{ pyenv_path }}/plugins/pyenv-virtualenv
    - user: {{ user }}
    - require:
      - pyenv

pyenv-virtualenvwrapper:
  git.latest:
    - name: https://github.com/pyenv/pyenv-virtualenvwrapper.git
    - target: {{ pyenv_path }}/plugins/.pyenv-virtualenvwrapper
    - user: {{ user }}
    - require:
      - pyenv

nvm:
  cmd.run:
    - name: 'curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash'
    - unless: test -d /home/{{ user }}/.nvm
    - runas: {{ user }}
    - cwd: /home/{{ user }}
    - require:
      - {{ user }}
