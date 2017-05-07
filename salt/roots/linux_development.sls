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

pyenv_linux_dependencies:
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

yarn-ppa:
  pkgrepo.managed:
    - humanname: Yarn
    - name: deb https://dl.yarnpkg.com/debian/ stable main
    - key_url: https://dl.yarnpkg.com/debian/pubkey.gpg
    - file: /etc/apt/sources.list.d/yarn.list

yarn:
  pkg.latest:
    - require:
      - yarn-ppa

google-cloud-sdk-ppa:
  pkgrepo.managed:
    - humanname: Google Cloud SDK
    - name: deb https://packages.cloud.google.com/apt cloud-sdk-stretch main
    - key_url: https://packages.cloud.google.com/apt/doc/apt-key.gpg
    - file: /etc/apt/sources.list.d/google-cloud-skd.list

google-cloud-sdk:
  pkg.latest:
    - pkgs:
      - google-cloud-sdk
      - google-cloud-sdk-app-engine-python
      - kubectl
    - require:
      - google-cloud-sdk-ppa
