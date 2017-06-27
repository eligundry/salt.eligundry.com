base:
  '*':
    - shared
  'kernel:Linux':
    - match: grain
    - linux
  'kernel:Darwin':
    - match: grain
    - mac
  'eligundry_device:media-center':
    - match: grain
    - linux-desktop
    - media-center
  'eligundry_device:thinkpad':
    - match: grain
    - linux-desktop
    - linux-desktop.discord
    - linux-desktop.dropbox
    - linux-desktop.emojione
    - linux-desktop.mattermost
    - linux-desktop.slack
    - linux-desktop.veracrypt
    - linux-desktop.virtualbox
    - linux-desktop.vs-code
    - linux.google-cloud
    - linux.yarn
    - thinkpad
  'virtual:VirtualBox':
    - match: grain
    - linux-desktop
    - media-center
    - thinkpad
