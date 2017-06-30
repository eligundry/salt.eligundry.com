{% set user = pillar['user']['name'] %}
{% set pyenv_path = pillar['user']['home'] + '/.pyenv' %}

pyenv-dependencies:
  pkg.installed:
    - comment: "Packages that pyenv needs to compile Python"
    - pkgs:
      {% if grains['os'] == 'MacOS' %}
      - sqlite
      - readline
      - xz
      {% else %}
      - build-essential
      - libbz2-dev
      - libreadline-dev
      - libsqlite3-dev
      - libssl-dev
      - llvm
      - make
      - wget
      - zlib1g-dev
      {% endif %}

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
    - source: salt://shared/pyenv/default-packages
    - user: {{ user }}
    - require:
      - pyenv-default-packages

# @TODO This is causing terrrible performance on shell init'ing on OSX. Figure
# out why and reneable this as it allows tox to work really well.
# pyenv-implicit:
#   git.latest:
#     - name: https://github.com/concordusapps/pyenv-implict.git
#     - target: {{ pyenv_path }}/plugins/pyenv-implict
#     - user: {{ user }}
#     - require:
#       - pyenv

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

{% for dst, config in pillar['repos'].items() %}
{% set version = config.get('python') %}

{% if version %}
pyenv-python-{{ version }}:
  pyenv.installed:
    - name: python-{{ version }}
    - user: {{ user }}
{% endif %}

{% endfor %}
