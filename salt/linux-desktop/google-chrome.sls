google-chrome-ppa:
  pkgrepo.managed:
    - humanname: Google Chrome
    - name: deb http://dl.google.com/linux/chrome/deb/ stable main
    - key_url: https://dl-ssl.google.com/linux/linux_signing_key.pub
    - architectures: amd64
    - file: /etc/apt/sources.list.d/google-chrome.list
    - clean_file: true

google-chrome:
  pkg.installed:
    - pkgs:
      - google-chrome-stable
    - require:
      - google-chrome-ppa

uninstall-other-chromes:
  pkg.removed:
    - pkgs:
      - google-chrome-beta
      - google-chrome-unstable
