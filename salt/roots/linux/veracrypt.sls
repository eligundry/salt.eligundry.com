veracrypt-ppa:
  pkgrepo.managed:
    - humanname: VeraCrypt
    - name: deb http://ppa.launchpad.net/unit193/encryption/ubuntu zesty main
    - keyid: B58A653A
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/veracrypt.list

veracrypt:
  pkg.latest:
    - require:
      - veracrypt-ppa
