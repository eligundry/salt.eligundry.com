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
    - thinkpad
  'virtual:VirtualBox':
    - match: grain
    - linux-desktop
    - media-center
    - thinkpad
