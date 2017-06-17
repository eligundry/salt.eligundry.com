spotify/docker-gc:
  dockerng.image_present

# docker-cleanup:
#   - special: '@daily'
#   - name: "docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc:ro spotify/docker-gc"
