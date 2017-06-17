docker-py:
  pip.installed

docker-gc:
  dockerng.image_present:
    - name: spotify/docker-gc
    - require: docker-py

docker-cleanup:
  - special: '@daily'
  - name: "docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc:ro spotify/docker-gc"
  - require:
    - docker-gc
