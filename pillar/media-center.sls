hostname: kodi-{{ grains['os']|lower }}

dhcp:
  interface: eno1
  domain: dmz.dangerzone
  base: 192.168.69
