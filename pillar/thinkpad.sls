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
