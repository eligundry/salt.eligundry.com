{% set user = pillar['user']['name'] %}
{% set pyenv_path = '/home/' + user + '/.pyenv' %}

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
    - humanname: Neovim
    - name: deb http://ppa.launchpad.net/neovim-ppa/unstable/ubuntu zesty main
    - keyid: 8231B6DD
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/neovim.list
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

pyenv_install:
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
  git.latest:
    - name: https://github.com/pyenv/pyenv.git
    - target: {{ pyenv_path }}

pyenv-default-packages:
  git.latest:
    - name: https://github.com/jawshooah/pyenv-default-packages.git
    - target: {{ pyenv_path }}/plugins/pyenv-default-packages
    - require:
      - pyenv_install

pyenv-implicit:
  git.latest:
    - name: https://github.com/concordusapps/pyenv-implict.git
    - target: {{ pyenv_path }}/plugins/pyenv-implict
    - require:
      - pyenv_install

pyenv-virtualenv:
  git.latest:
    - name:  https://github.com/pyenv/pyenv-virtualenv.git
    - target: {{ pyenv_path }}/plugins/pyenv-virtualenv
    - require:
      - pyenv_install

pyenv-virtualenvwrapper:
  git.latest:
    - name: https://github.com/pyenv/pyenv-virtualenvwrapper.git
    - target: {{ pyenv_path }}/plugins/.pyenv-virtualenvwrapper
    - require:
      - pyenv_install

nvm:
  cmd.run:
    - name: 'curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash'
    - unless: test -d /home/{{ user }}/.nvm
    - runas: {{ user }}
    - cwd: /home/{{ user }}
    - require:
      - {{ user }}

yarn:
  pkgrepo.managed:
    - humanname: Yarn
    - name: deb https://dl.yarnpkg.com/debian/ stable main
    - key_url: https://dl.yarnpkg.com/debian/pubkey.gpg
    - file: /etc/apt/sources.list.d/yarn.list
    - require:
      - apt_extensions
  pkg.latest:
    - name: yarn
