nvidia-driver:
  pkg.installed

/etc/X11/xorg.conf.d/20-nvidia.conf:
  file.managed:
    - user: root
    - group: root
    - makedirs: true
    - contents: |
        Section "Device"
          Identifier "nvidia"
          Driver "nvidia"
        EndSection
