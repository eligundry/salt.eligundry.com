dots:
  .bash_profile: bash_profile
  .bashrc: bashrc
  .commonprofile: commonprofile
  .ctags: ctags
  .eslintrc: eslintrc
  .config/nvim: config/nvim
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
  .wgetrc: wgetrc
  .vim: config/nvim
  .vimrc: config/nvim/init.vim
  .zsh: zsh
  .zshrc: zshrc
{% if grains['kernel'] == 'Linux' %}
  .config/redshift.conf: config/redshift.conf
  .config/terminator: config/terminator
  .config/xfce4/helpers.rc: config/xfce4/helpers.rc
  .config/xfce4/panel: config/xfce4/panel
  .config/xfce4/terminal: config/xfce4/terminal
  .config/xfce4/xfconf/xfce-perchannel-xml/keyboards.xml: config/xfce4/xfconf/xfce-perchannel-xml/keyboards.xml
  .config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml: config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
  .config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml: config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
  .config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml: config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml
  .config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml: config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
  .config/kitty: config/kitty
  .gtkrc-2.0: gtkrc-2.0
  .nethackrc: nethackrc
  .Xdefaults: Xdefaults
  .xinitrc: xinitrc
  .Xresources: Xresources
  .xsessionrc: xsessionrc
  .zshenv: zshenv
  .themes/eligundry/gnome-shell/gnome-shell.css: themes/eligundry/gnome-shell/gnome-shell.css
{% elif grains['kernel'] == 'Darwin' %}
  .item2_profiles.json: item2_profiles.json
{% endif %}

dots_libs:
  zplug: https://github.com/zplug/zplug.git
  base16-shell: https://github.com/chriskempson/base16-shell.git
  base16-terminal-app: https://github.com/korzhyk/base16-terminal-app.git
  pipes: https://github.com/pipeseroni/pipes.sh.git
