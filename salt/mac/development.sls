coreutils:
  pkg.installed:
    - pkgs:
      - coreutils
      - less

git-lfs:
  pkg.installed

gnupg:
  pkg.installed:
    - pkgs:
      - gnupg
      - pinentry-mac
  file.append:
    - name: {{ pillar['user']['home'] }}/.gnupg/gpg-agent.conf
    - text: 'pinentry-program /usr/local/bin/pinentry-mac'

google-cloud-sdk:
  pkg.installed:
    - name: caskroom/cask/google-cloud-sdk

docker:
  pkg.installed:
    - name: caskroom/cask/docker

insomnia:
  pkg.installed:
    - name: caskroom/cask/insomnia

iterm2:
  pkg.installed:
    - name: caskroom/cask/iterm2

go:
  pkg.installed

java:
  pkg.installed:
    - name: caskroom/cask/java

macvim:
  pkg.installed

mas:
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

postman:
  pkg.installed:
    - name: caskroom/cask/postman

python:
  pkg.installed:
    - pkgs:
      - python
      - python3
      - sqlite

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

vagrant:
  pkg.installed:
    - pkgs:
      - caskroom/cask/vagrant
      - caskroom/cask/virtualbox

vs-code:
  pkg.installed:
    - name: caskroom/cask/visual-studio-code

yarn:
  pkg.installed
