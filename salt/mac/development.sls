git:
  pkg.installed:
    - pkgs:
      - git
      - git-lfs

docker:
  pkg.installed:
    - name: caskroom/cask/docker

iterm2:
  pkg.installed:
    - name: caskroom/cask/iterm2

go:
  pkg.installed

htop:
  pkg.installed

java:
  pkg.installed:
    - name: caskroom/cask/java

jq:
  pkg.installed

mobile-shell:
  pkg.installed

minikube:
  pkg.installed:
    - name: caskroom/cask/minikube

mysql:
  pkg.installed

mysqlworkbench:
  pkg.installed:
    - name: caskroom/cask/mysqlworkbench

neovim:
  pkg.installed

npm:
  pkg.installed

pgadmin:
  pkg.installed:
    - name: homebrew/php/phppgadmin

php:
  pkg.installed:
    - pkgs:
      - homebrew/php/php72
      - homebrew/php/composer

python:
  pkg.installed:
    - pkgs:
      - python
      - python3
      - sqlite

pwgen:
  pkg.installed

reattach-to-user-namespace:
  pkg.installed

rust:
  pkg.installed

staruml:
  pkg.installed:
    - name: caskroom/cask/staruml

sshfs:
  pkg.installed

the_silver_searcher:
  pkg.installed

tree:
  pkg.installed

tmux:
  pkg.installed

vagrant:
  pkg.installed:
    - pkgs:
      - caskroom/cask/vagrant
      - caskroom/cask/virtualbox

vim:
  pkg.installed:
    - pkgs:
      - macvim
      - vim

vs-code:
  pkg.installed:
    - name: caskroom/cask/visual-studio-code

wget:
  pkg.installed

yarn:
  pkg.installed

zsh:
  pkg.installed
