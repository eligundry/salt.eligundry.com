{% set version = '2.0.2' %}

playerctl:
  pkg.installed:
    - sources:
      - playerctl: 'https://github.com/acrisci/playerctl/releases/download/v{{ version }}/playerctl-{{ version }}_amd64.deb'
