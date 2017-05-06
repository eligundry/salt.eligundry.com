{% user_name = pillar['user']['name'] %}
{% pyenv_path = /home/{{ user_name }}/.pyenv %}

development_pkgs:
  pkg.latest:
    - pkgs:
      - curl
      - git
      - htop
      - python
      - python3
      - silversearcher-ag
      - tmux
      - vim
      - zsh

neovim:
  pkgrepo.managed:
    - ppa: neovim-ppa/unstable
  pkg.latest:
    - name: neovim

docker:
  pkg.installed:
    - pkgs:
      - docker
      - docker-compose
  user.present:
    - name: docker
    - groups:
      - docker
      - users
    - createhome: True
    - fullname: Moby Dock
    - empty_password: True

pyenv:
  pkg.installed:
    - pkgs:
      - make
      - build-essential
      - libssl-dev
      - zlib1g-dev
      - libbz2-dev
      - libreadline-dev
      - libsqlite3-dev
      - wget
      - curl
      - llvm
  pyenv.install_pyenv:
    user: {{ user_name }}

python-2.7.11:
  pyenv.installed:
    - default: False
    - require: pyenv

python-3.6.1:
  pyenv.installed:
    - default: True
    - require: pyenv

pyenv-default-packages:
  git.latest:
    - name: https://github.com/jawshooah/pyenv-default-packages.git
    - target: {{ pyenv_path }}/plugins/pyenv-default-packages
    - require:
      - pyenv

pyenv-implicit:
  git.latest:
    - name: https://github.com/concordusapps/pyenv-implict.git
    - target: {{ pyenv_path }}/plugins/pyenv-implict
    - require:
      - pyenv

pyenv-virtualenv:
  git.latest:
    - name:  https://github.com/pyenv/pyenv-virtualenv.git
    - target: {{ pyenv_path }}/plugins/pyenv-virtualenv
    - require:
      - pyenv

pyenv-virtualenvwrapper:
  git.latest:
    - name: https://github.com/pyenv/pyenv-virtualenvwrapper.git
    - target: {{ pyenv_path }}/plugins/.pyenv-virtualenvwrapper
    - require:
      - pyenv

nvm:
  cmd.run:
    - name: 'curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash'
    - unless: test -f /home/{{ user_name }}/.nvm
    - runas: {{ user_name }}
    - cwd: /home/{{ user_name }}
    - require:
      - {{ user_name }}
