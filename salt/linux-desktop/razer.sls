openrazer-ppa:
  pkgrepo.managed:
    - humanname: OpenRazer
    - name: 'deb http://download.opensuse.org/repositories/hardware:/razer/Debian_{{ grains['lsb_distrib_release']|capitalize }}/ /'
    - key_url: https://download.opensuse.org/repositories/hardware:razer/Debian_Unstable/Release.key
    - file: /etc/apt/sources.list.d/openrazer.list

openrazer:
  pkg.installed:
    - name: openrazer-meta
    - require:
      - openrazer-ppa
