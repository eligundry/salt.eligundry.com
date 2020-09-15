website:
  virtual_host: 'eligundry.com,www.eligundry.com'
  basic_auth:
    username: eligundry
    password: password

digitalocean:
  spaces:
    endpoint: 'nyc3.digitaloceanspaces.com'
    bucket: 'bucket'
    access_key: 'xxxx'
    secret_key: 'xxxx'
    cdn_url: 'https://example.com'

letsencrypt:
  host: 'eligundry.com,www.eligundry.com'
  email: 'eligundry@gmail.com'
  test: '0'
