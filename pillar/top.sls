'base':
  '*':
    - aws
    - dev-website
    - dots
    - repos
    - ssh
    - sudoers
    - system
    - user
  'eligundry_device:thinkpad':
    - match: grain
    - thinkpad
  'eligundry_device:media-center':
    - match: grain
    - media-center
  'os:MacOS':
    - match: grain
    - macbook
  'eligundry_device:server':
    - match: grain
    - server
    - website
    - openvpn
  'virtual:VirtualBox':
    - match: grain
    - vagrant
