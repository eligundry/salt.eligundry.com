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

polychromatic-ppa:
  pkgrepo.managed:
    - humanname: Polychromatic - GUI to style Razer devices
    - name: 'deb http://ppa.launchpad.net/polychromatic/stable/ubuntu focal main'
    - keyid: 96B9CD7C22E2C8C5
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/polychromatic.list

polychromatic:
  pkg.installed:
    - require: openrazer
