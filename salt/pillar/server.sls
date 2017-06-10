docker_pull_latest: False

website:
  virtual_host: '.eligundry.com'
  letsencrypt:
    host: 'eligundry.com,www.eligundry.com'
    email: 'eligundry@gmail.com'
    test: '0'

openvpn:
  path: /opt/openvpn
  server: eligundry.ninja

pi-hole:
  virtual_host: pihole.dangerzone.ninja
  password: password

authy_api_token: password
