hostname: eli-thinkpad
work_machine: True

samba:
  conf:
    render:
      section_order: [ 'global', 'homes' ]
      include_unordered_sections: yes
