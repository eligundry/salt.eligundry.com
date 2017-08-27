google-chrome-ppa:
  pkgrepo.managed:
    - humanname: Google Chrome
    - name: deb http://dl.google.com/linux/chrome/deb/ stable main
    - key_url: https://dl-ssl.google.com/linux/linux_signing_key.pub
    - architectures: amd64
    - file: /etc/apt/sources.list.d/google-chrome.list

google-chrome:
  pkg.latest:
    - pkgs:
      - google-chrome-beta
      - google-chrome-stable
      - google-chrome-unstable
      - chromium
    - require:
      - google-chrome-ppa
