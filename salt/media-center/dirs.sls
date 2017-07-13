media-center-external-hdd:
  file.directory:
    - name: {{ pillar['data_dir'] }}
    - user: {{ pillar['user']['name'] }}
    - group: users
    - dir_mode: 775
    - file_mode: 664
    - recurse:
      - user
      - group
      - mode
