docker-py:
  pip.installed

spotify/docker-gc:
  dockerng.image_present:
    - require: docker-py

docker-cleanup:
  - special: '@daily'
  - name: "docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc:ro spotify/docker-gc"
  - require:
    - spotify/docker-gc
