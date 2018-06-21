hostname: eli-thinkpad
work_machine: True

samba:
  conf:
    render:
      section_order: [ 'global', 'homes' ]
      include_unordered_sections: yes

    sections:
      homes:
        'valid users': eligundry
        browsable: no
        writable: yes

      1TB:
        comment: "The big boy"
        path: /mnt/1TB
        'valid users':  eligundry
