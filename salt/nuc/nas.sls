nfs-common:
  pkg.installed

/mnt/queensbridge:
  mount.mounted:
    device: queensbridge:/nfs/eligundry
    fstype: nfs
    mkmnt: true
    persist: true
    mount: true
