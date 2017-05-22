virtualbox-ppa:
  pkgrepo.managed:
    - humanname: VirtualBox
    - name: deb http://download.virtualbox.org/virtualbox/debian stretch non-free contrib
    - key_url: https://www.virtualbox.org/download/oracle_vbox_2016.asc
    - file: /etc/apt/sources.list.d/virtualbox.list

virtualbox:
  pkg.latest:
    - name: virtualbox-5.1
    - require:
      - virtualbox-ppa
