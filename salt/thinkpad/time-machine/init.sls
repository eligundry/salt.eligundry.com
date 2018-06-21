# I want to use the spinning HDD in my Thinkpad as a Time Machine Backup

{% set tm = pillar['time-machine'] %}

time-machine-user:
  user.present:
    - name: {{ tm['user'] }}
    - fullname: Time Machine
    - password: {{ tm['password'] }}
    - home: {{ tm['dir'] }}
    - gid_from_name: True
    - shell: /usr/sbin/nologin

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
    - name: deb http://ppa.launchpad.net/jrnewell/netatalk/ubuntu bionic main
    - keyid: 77A99C33
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/netatalk.list
    - clean_file: True

netatalk:
  pkg.installed:
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
