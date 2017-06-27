yarn-ppa:
  pkgrepo.managed:
    - humanname: Yarn
    - name: deb https://dl.yarnpkg.com/debian/ stable main
    - key_url: https://dl.yarnpkg.com/debian/pubkey.gpg
    - file: /etc/apt/sources.list.d/yarn.list

yarn:
  pkg.latest:
    - require:
      - yarn-ppa
