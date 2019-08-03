hostname: eli-thinkpad
work_machine: True

samba:
  conf:
    render:
      section_order: [ 'global', 'homes', '1TB' ]
      include_unordered_sections: yes

    sections:
      homes:
        'valid users': eligundry

      1TB:
        comment: "The big boy"
        path: /mnt/1TB
        'valid users':  eligundry
        public: no
        writable: yes
        printable: no

time-machine:
  user: timemachine
  password: password
  dir: /mnt/1TB/time-machine
  max_size: 300000
  name: thinkpad-time-machine

ddns:
  email: eli@example.com
  api_key: xxxxxxxxxxx
  zone: example.com
  subdomain: home
