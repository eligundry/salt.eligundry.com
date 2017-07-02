'base':
  '*':
    - system
    - user
    - dots
    - repos
    - sudoers
  'eligundry_device:thinkpad':
    - match: grain
    - thinkpad
  'eligundry_device:media-center':
    - match: grain
    - media-center
  'os:MacOS':
    - match: grain
    - macbook
  'virtual:VirtualBox':
    - match: grain
    - vagrant
