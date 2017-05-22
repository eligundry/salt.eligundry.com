spotify-ppa:
  pkgrepo.managed:
    - humanname: Spotify
    - name: deb http://repository.spotify.com stable non-free
    - keyid: BBEBDCB318AD50EC6865090613B00F1FD2C19886
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/spotify.list

spotify:
  pkg.latest:
    - name: spotify-client
    - require:
      - spotify-ppa
