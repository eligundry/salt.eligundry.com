{{ pillar['data_dir'] }}:
  file.directory:
    - user: {{ pillar['user']['name'] }}
    - group: users
    - dir_mode: 775
    - file_mode: 664
    - recurse:
      - user
      - group
      - mode
