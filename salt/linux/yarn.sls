# I'm no longer using yarn and I don't want to maintain this any longer
# yarn-ppa:
#   pkgrepo.managed:
#     - humanname: Yarn
#     - name: deb https://dl.yarnpkg.com/debian/ stable main
#     - key_url: https://dl.yarnpkg.com/debian/pubkey.gpg
#     - file: /etc/apt/sources.list.d/yarn.list
#     - clean_file: true
#
# yarn:
#   pkg.installed:
#     - require:
#       - yarn-ppa

yarn-ppa:
  pkgrepo.absent:
    - name: yarn

yarn:
  pkg.purged
