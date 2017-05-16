base:
  '*':
    - system
    - user
    - dots
    - pyenv
    - nvm
  'kernel:Linux':
    - match: grain
    - apt
    - ctags
    - docker
    - linux_desktop
    - linux_development
    - google-cloud
    - xfce
    - neovim
  'kernel:Darwin':
    - match: grain
    - mac_development
