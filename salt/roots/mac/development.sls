git:
  pkg.installed

docker:
  pkg.installed:
    - name: caskroom/cask/docker

iterm2:
  pkg.installed:
    - name: caskroom/cask/iterm2

htop:
  pkg.installed

minikube:
  pkg.installed:
    - name: caskroom/cask/minikube

mysql:
  pkg.installed

neovim:
  pkg.installed

python:
  pkg.installed:
    - pkgs:
      - python
      - python3
      - sqlite

the_silver_searcher:
  pkg.installed

tree:
  pkg.installed

tmux:
  pkg.installed

vim:
  pkg.installed:
    - pkgs:
      - macvim
      - vim

vs-code:
  pkg.installed:
    - name: caskroom/cask/visual-studio-code

yarn:
  pkg.installed

zsh:
  pkg.installed
