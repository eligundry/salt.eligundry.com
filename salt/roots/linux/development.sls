cli_pkgs:
  pkg.latest:
    - comment: "Commonly used CLI packages."
    - pkgs:
      - curl
      - git
      - htop
      - python
      - python3
      - python-pip
      - silversearcher-ag
      - tmux
      - vagrant
      - vim
      - zsh

mysql:
  pkg.latest:
    - pkgs:
      - libmysqlclient-dev
