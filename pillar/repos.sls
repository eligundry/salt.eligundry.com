repos:
  bucketstore:
    git: git@github.com:eligundry/bucketstore.git
    tmuxifier:
      pre_cmd: pyenv activate bs
      webapp: False
  dj-reddit:
    git: git@github.com:eligundry/dj-reddit.git
    tmuxifier:
      pre_cmd: pyenv activate dj
      webapp: False
  eligundry.com:
    git: git@github.com:eligundry/eligundry.com.git
    tmuxifier:
      webapp: True
      webapp_cmds:
        server: docker-compose up
        js_build: None
  salt.eligundry.com:
    git: git@github.com:eligundry/salt.eligundry.com.git
    tmuxifier:
      webapp: False

go-repos:
  vouch:
    git: https://github.com/vouch/vouch-proxy.git
    path: github.com/vouch/vouch-proxy

hosts:
  eligundry.dev: 127.0.0.1
