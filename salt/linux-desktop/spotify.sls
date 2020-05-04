spotify-ppa:
  pkgrepo.managed:
    - humanname: Spotify
    - name: deb https://repository.spotify.com stable non-free
    - keyfile: https://download.spotify.com/debian/pubkey.gpg
    - file: /etc/apt/sources.list.d/spotify.list
    - clean_file: true

spotify:
  pkg.installed:
    - name: spotify-client
    - require:
      - spotify-ppa
