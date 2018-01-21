bash:
  pkg.installed

{% if grains['os'] == 'MacOS' -%}
/etc/shells:
  file.append:
    - text:
      - /usr/local/bin/bash
    - require:
      - bash
{% endif %}

curl:
  pkg.installed

emacs:
  pkg.installed

git:
  pkg.installed

htop:
  pkg.installed

jq:
  pkg.installed

openssh-pkg:
  pkg.installed:
    - name: openssh

pwgen:
  pkg.installed

tmux:
  pkg.installed

tree:
  pkg.installed

vim:
  pkg.installed

wget:
  pkg.installed

zsh:
  pkg.installed
