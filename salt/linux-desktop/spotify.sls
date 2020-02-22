spotify-ppa:
  pkgrepo.managed:
    - humanname: Spotify
    - name: deb http://repository.spotify.com stable non-free
    - keyfile: https://download.spotify.com/debian/pubkey.gpg
    - file: /etc/apt/sources.list.d/spotify.list

spotify:
  pkg.installed:
    - name: spotify-client
    - require:
      - spotify-ppa
