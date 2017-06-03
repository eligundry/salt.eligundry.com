/usr/local/bin/authy-ssh.conf:
  file.managed:
    - source: salt://server/authy/authy-ssh.conf
    - user: root
    - group: root
    - mode: 600
    - template: jinja
    - require:
      - salt_gpg

authy-ssh:
  cmd.run:
    - cwd: {{ pillar['repo_path'] }}/bin
    - name: bash authy-install.sh
    - comment: "Install the authy-ssh module."
    - creates:
      - /usr/local/bin/authy-ssh
    - require:
      - curl
      - ssh
      - /usr/local/bin/authy-ssh.conf
