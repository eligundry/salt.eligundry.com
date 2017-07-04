hostname: kodi-{{ grains['os']|lower }}
torrent_dir: /mnt/3TB/Torrents

# Default Transmission settings
transmission:
  dir: /var/lib/transmission-daemon/Downloads
  password: "{677c997329b95aa73b110ad7e5dc587c67fe980781905/Yn"

dhcp:
  interface: eno1
  domain: dmz.dangerzone
  base: 192.168.69
