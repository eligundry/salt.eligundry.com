'base':
  '*':
    - .defaults
    - .ssh
    - .sudoers
    - .system
    - .user
    - .fonts
    - dots
  'os:MacOS':
    - match: grain
    - .repos
    - .macbook
  'eligundry_device:server':
    - match: grain
    - .server
    - .https-portal
    - .website
  'virtual:VirtualBox':
    - match: grain
    - .vagrant
