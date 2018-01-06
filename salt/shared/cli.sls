bash:
  pkg.installed

{% grains['os'] == 'MacOS' -%}
/etc/shells:
  file.append:
    - text:
      - /usr/local/bin/bash
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
