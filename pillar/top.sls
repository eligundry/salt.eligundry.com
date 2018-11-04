'base':
  '*':
    - defaults
    - dots
    - ssh
    - sudoers
    - system
    - user
    - talentinc
  'eligundry_device:thinkpad':
    - match: grain
    - repos
    - thinkpad
  'eligundry_device:media-center':
    - match: grain
    - media-center
  'os:MacOS':
    - match: grain
    - repos
    - macbook
  'eligundry_device:server':
    - match: grain
    - server
    - https_portal
    - website
    - openvpn
    - znc
  'virtual:VirtualBox':
    - match: grain
    - vagrant
