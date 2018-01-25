include:
  - shared.system
  - shared.user
  - shared.dots
  - shared.pyenv
  - shared.nvm
  - shared.npm
  - shared.repos
  - shared.aws
  - shared.cli
  - shared.tmuxifier
  - shared.weechat
  {% if pillar['user']['pass'] %}
  - shared.pass
  {% endif %}
