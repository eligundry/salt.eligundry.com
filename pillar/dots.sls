dots:
  .bash_profile: bash_profile
  .bashrc: bashrc
  .commonprofile: commonprofile
  .ctags: ctags
  .eslintrc: eslintrc
  .config/nvim: config/nvim
  .config/pianobar: config/pianobar
  .dir_colors: dir_colors
  .git_template: git_template
  .gitattributes: gitattributes
  .gitconfig: gitconfig
  .gitexcludes: gitexcludes
  .gitignore: gitignore
  .ideavimrc: ideavimrc
  .inputrc: inputrc
  .profile: profile
  .psqlrc: psqlrc
  .tmux: tmux
  .tmux.conf: tmux.conf
  .weechat: weechat
  .wgetrc: wgetrc
  .vim: config/nvim
  .vimrc: config/nvim/init.vim
  .zsh: zsh
  .zshrc: zshrc
{% if grains['kernel'] == 'Linux' %}
  .config/terminator: config/terminator
  .config/redshift.conf: config/redshift.conf
  .gtkrc-2.0: gtkrc-2.0
  .nethackrc: nethackrc
  .Xdefaults: Xdefaults
  .xinitrc: xinitrc
  .Xresources: Xresources
  .xsessionrc: xsessionrc
{% endif %}
{% if grains['kernel'] == 'Darwin' %}
  .item2_profiles.json: item2_profiles.json
{% endif %}

dots_libs:
  zplug: https://github.com/zplug/zplug.git
  tmuxifier: https://github.com/jimeh/tmuxifier.git
  base16-shell: https://github.com/chriskempson/base16-shell.git
  base16-terminal-app: https://github.com/korzhyk/base16-terminal-app.git
  pipes: https://github.com/pipeseroni/pipes.sh.git
