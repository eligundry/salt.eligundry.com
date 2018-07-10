'base':
  '*':
    - defaults
    - dots
    - ssh
    - sudoers
    - system
    - user
  'eligundry_device:thinkpad':
    - match: grain
    - cloudflare
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
    - cloudflare
    - server
    - website
    - openvpn
    - znc
  'virtual:VirtualBox':
    - match: grain
    - vagrant
