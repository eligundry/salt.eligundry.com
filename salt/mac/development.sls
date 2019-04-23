coreutils:
  pkg.installed:
    - pkgs:
      - coreutils
      - less

git-lfs:
  pkg.removed

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
  pkg.removed:
    - name: caskroom/cask/insomnia

iterm2:
  pkg.installed:
    - name: caskroom/cask/iterm2

java:
  pkg.installed:
    - name: caskroom/cask/java

macvim:
  pkg.installed

mas:
  pkg.installed

mitmproxy:
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

nodejs:
  pkg.installed

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
  pkg.removed:
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
