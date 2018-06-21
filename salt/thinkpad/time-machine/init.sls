# I want to use the spinning HDD in my Thinkpad as a Time Machine Backup

{% set tm = pillar['time-machine'] %}

time-machine-user:
  user.present:
    - name: {{ tm['user'] }}
    - fullname: Time Machine
    - password: {{ tm['password'] }}
    - home: {{ tm['dir'] }}
    - gid_from_name: True

{{ tm['dir'] }}:
  file.directory:
    - user: {{ tm['user'] }}
    - group: {{ tm['user'] }}
    - dir_mode: 755
    - file_mode: 644
    - require:
      - time-machine-user

# AFP provider for Linux
netatalk-ppa:
  pkgrepo.managed:
    - humanname: netatalk - Open source AFP fileserver
    - name: deb http://ppa.launchpad.net/sico/netatalk/ubuntu {{ pillar['debian_ppa_codename'] }} main
    - keyid: A859EF20
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/neovim.list
    - clean_file: True

netatalk:
  pkg.install:
    - pkgs:
      - netatalk
      - avahi-daemon
    - require:
      - netatalk-ppa

netatalk-service:
  service.running:
    - name: netatalk
    - enabled: True

avahi-daemon-service:
  service.enabled:
    - name: avahi-daemon
    - enabled: True

/etc/netatalk/afp.conf:
  file.managed:
    - source: salt://thinkpad/time-machine/afp.conf
    - user: root
    - group: root
    - defaults:
      - 'tm': tm
    - require:
      - netatalk
