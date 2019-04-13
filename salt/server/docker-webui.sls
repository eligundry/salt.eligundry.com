{% set docker_webui_image = 'pottava/docker-webui' %}

{{ docker_webui_image }}:
  docker_image.present:
    - force: {{ pillar['docker_pull_latest'] }}

docker-webui:
  docker_container.running:
    - image: {{ docker_webui_image }}
    - port_bindings:
      - 81:9000
    # - networks:
    #   - https-portal-network:
    #     - aliases:
    #       - docker-webui
    - volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    - require:
      - https-portal-network
