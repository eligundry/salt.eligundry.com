'base':
  '*':
    - defaults
    - dots
    - ssh
    - sudoers
    - system
    - user
    - talentinc
    - fonts
  'eligundry_device:thinkpad':
    - match: grain
    - repos
    - thinkpad
  'eligundry_device:nuc':
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
    - https-portal
    - website
    - openvpn
    - znc
  'virtual:VirtualBox':
    - match: grain
    - vagrant
