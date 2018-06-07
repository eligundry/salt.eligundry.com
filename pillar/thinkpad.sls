hostname: eli-thinkpad
work_machine: True

nfs:
  server:
    exports:
      /mnt/1TB: "thinkpad gss/krb5i(rw,sync,fsid=0,crossmnt,no_subtree_check)"
  mount:
    1TB:
      mountpoint: "/mnt/1TB"
      location: "localhost:/1TB"
