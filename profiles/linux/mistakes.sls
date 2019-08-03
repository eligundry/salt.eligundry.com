# Packages that were mistakes to install in the first place.
# These will remove them once and for all.

# Git-LFS is the devil
git-lfs:
  pkg.removed

/etc/apt/sources.list.d/git-lfs.list:
  file.absent
