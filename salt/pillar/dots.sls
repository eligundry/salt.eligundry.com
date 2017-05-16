dots:
  bash_profile: .bash_profile
  bashrc: .bashrc
  commonprofile: .commonprofile
  ctags: .ctags
  eslintrc: .eslintrc
  bin: .bin
  config/nvim: .config/nvim
  config/pianobar: .config/pianobar
  dir_colors: .dir_colors
  git_template: .git_template
  gitattributes: .gitattributes
  gitconfig: .gitconfig
  gitexcludes: .gitexcludes
  gitignore: .gitignore
  ideavimrc: .ideavimrc
  inputrc: .inputrc
  oh-my-zsh/custom: .oh-my-zsh/custom
  profile: .profile
  psqlrc: .psqlrc
  tmux.conf: .tmux.conf
  weechat: .weechat
  wgetrc: .wgetrc
  zsh: .zsh
  zshrc: .zshrc
{% if grains['kernel'] == 'Linux' %}
  config/terminator: .config/terminator
  config/redshift.conf: .config.redshift.conf
  gtkrc-2.0: .gtkrc-2.0
  nethackrc: .nethackrc
  Xdefaults: .Xdefaults
  xinitrc: .xinitrc
  Xresources: .Xresources
  xsessionrc: .xsessionrc
{% endif %}
{% if grains['kernel'] == 'Darwin' %}
  item2_profiles.json: .item2_profiles.json
{% endif %}
