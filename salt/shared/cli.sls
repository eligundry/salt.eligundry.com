{% set isMacOS = grains['os'] == 'MacOS' %}

bash:
  pkg.installed

bc:
  pkg.installed

{% if isMacOS  -%}
/etc/shells:
  file.append:
    - text:
      - /usr/local/bin/bash
      - /usr/local/bin/dash
    - require:
      - bash
      - dash
{% endif %}

curl:
  pkg.installed

emacs:
  pkg.installed

graphviz:
  pkg.installed

git:
  pkg.installed

htop:
  pkg.installed

httpie:
  pkg.installed

jq:
  pkg.installed

multitail:
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

shellcheck:
  pkg.installed

slurm:
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
