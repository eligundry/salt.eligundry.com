hostname: kodi-{{ grains['os']|lower }}
torrent_dir: /mnt/3TB/Torrents

dhcp:
  interface: eno1
  domain: dmz.dangerzone
  base: 192.168.69
