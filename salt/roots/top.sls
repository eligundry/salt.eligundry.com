base:
  '*':
    - system
    - user
    - development
    - dots
    - docker
  'kernel:Linux':
    - match: grain
    - linux_desktop
    - linux_development
    - xfce
