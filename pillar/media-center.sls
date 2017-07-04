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
    exports:
      /mnt/3TB: "kodi.dangerzone gss/krb5i(rw,sync,fsid=0,crossmnt,no_subtree_check)"
  mount:
    3TB:
      mountpoint: "/mnt/3TB"
      location: "localhost:/3TB"
