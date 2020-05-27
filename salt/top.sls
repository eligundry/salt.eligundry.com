base:
  '*':
    - shared
  'kernel:Linux':
    - match: grain
    - linux
    - sudoers
  'kernel:Darwin':
    - match: grain
    - mac
  'eligundry_device:personal_macbook':
    - match: grain
    - mac.fun
  'eligundry_device:nuc':
    - match: grain
    - linux-desktop
    - linux-desktop.discord
    - linux-desktop.dropbox
    - linux-desktop.slack
    - linux-desktop.vs-code
    - linux-desktop.ddns
    - nuc
  'eligundry_device:thinkpad':
    - match: grain
    - linux-desktop
    - linux-desktop.discord
    - linux-desktop.dropbox
    - linux-desktop.slack
    - linux-desktop.vs-code
    - thinkpad
  'eligundry_device:server':
    - match: grain
    - server
  'virtual:VirtualBox':
    - match: grain
    - linux-desktop
    - thinkpad
    - server
  'productname:Droplet':
    - match: grain
    - server.digitalocean
