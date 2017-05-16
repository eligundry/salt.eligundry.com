{% set user = pillar['user']['name'] %}
{% set home = '/home/' + user %}
{% set pyenv_path = home + '/.pyenv' %}

pyenv-dependencies:
  pkg.installed:
    - comment: "Packages that pyenv needs to compile Python"
    - pkgs:
      - build-essential
      - libbz2-dev
      - libreadline-dev
      - libsqlite3-dev
      - libssl-dev
      - llvm
      - make
      - wget
      - zlib1g-dev

pyenv:
  git.latest:
    - name: https://github.com/pyenv/pyenv.git
    - target: {{ pyenv_path }}
    - user: {{ user }}
    - require:
      - {{ user }}

pyenv-default-packages:
  git.latest:
    - name: https://github.com/jawshooah/pyenv-default-packages.git
    - target: {{ pyenv_path }}/plugins/pyenv-default-packages
    - user: {{ user }}
    - require:
      - pyenv

{{ pyenv_path }}/default-packages:
  file.managed:
    - source: salt://configs/pyenv/default-packages
    - user: {{ user }}
    - group: {{ user }}
    - require:
      - pyenv-default-packages

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
