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
    - name: homebrew/cask/google-cloud-sdk

docker:
  pkg.installed:
    - name: homebrew/cask/docker

insomnia:
  pkg.removed:
    - name: homebrew/cask/insomnia

iterm2:
  pkg.installed:
    - name: homebrew/cask/iterm2

java:
  pkg.installed:
    - name: homebrew/cask/java

mas:
  pkg.installed

mitmproxy:
  pkg.installed

mobile-shell:
  pkg.installed

minikube:
  pkg.installed:
    - name: homebrew/cask/minikube

mysql:
  pkg.installed

mysqlworkbench:
  pkg.installed:
    - name: homebrew/cask/mysqlworkbench

nodejs:
  pkg.installed

postman:
  pkg.installed:
    - name: homebrew/cask/postman

python:
  pkg.installed:
    - pkgs:
      - python
      - python3
      - sqlite
      - xz
      - zlib

reattach-to-user-namespace:
  pkg.installed

rust:
  pkg.installed

staruml:
  pkg.removed:
    - name: homebrew/cask/staruml

sshfs:
  pkg.installed

the_silver_searcher:
  pkg.installed

vs-code:
  pkg.installed:
    - name: homebrew/cask/visual-studio-code

yarn:
  pkg.installed
