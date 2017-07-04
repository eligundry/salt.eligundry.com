hostname: kodi-{{ grains['os']|lower }}
data_dir: /mnt/3TB

# Default Transmission settings
transmission:
  dir: /var/lib/transmission-daemon/Downloads
  password: "{677c997329b95aa73b110ad7e5dc587c67fe980781905/Yn"

dhcp:
  interface: eno1
  domain: dmz.dangerzone
  base: 192.168.69

nfs:
  server:
    exports: {}
  mount:
    3TB:
      mountpoint: "/mnt/3TB"
      locations: "localhost:/3TB"
