{% set os = grains['os']|lower %}
{% set codename = grains['lsb_distrib_codename'] %}

git-lfs-ppa:
  pkgrepo.managed:
    - humanname: Git LFS
    - name: deb https://packagecloud.io/github/git-lfs/{{ os }}/ {{ codename }} main
    - key_url: https://packagecloud.io/github/git-lfs/gpgkey
    - file: /etc/apt/sources.list.d/git-lfs.list

git-lfs:
  pkg.installed:
    - require:
      - git-lfs-ppa
