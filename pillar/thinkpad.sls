hostname: eli-thinkpad
work_machine: True

nfs:
  server:
    exports:
      /mnt/1TB: "192.168.31.0/24(rw,sync,no_subtree_check,sec=krb5)"
  mount:
    1TB:
      mountpoint: "/mnt/1TB"
      location: "localhost:/1TB"
