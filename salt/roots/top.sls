base:
  '*':
    - system
    - development
    - user
    - dots
  'kernel:Linux':
    - match: grain
    - linux_desktop
    - linux_development
    - linux_docker
    - xfce
