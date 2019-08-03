/usr/local/bin/authy-ssh.conf:
  file.managed:
    - source: salt://server/authy/authy-ssh.conf
    - user: root
    - group: root
    - mode: 600
    - template: jinja

authy-ssh:
  cmd.run:
    - cwd: {{ pillar['repo_path'] }}/bin
    - name: bash authy-install.sh
    - comment: "Install the authy-ssh module."
    - creates:
      - /usr/local/bin/authy-ssh
