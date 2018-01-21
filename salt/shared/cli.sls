{% set isMacOS = grains['os'] == 'MacOS' %}

bash:
  pkg.installed

{% if isMacOS  -%}
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
    {% if isMacOS %}
    - name: openssh
    {% else -%}
    - name: ssh
    {% endif %}

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
