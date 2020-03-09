include:
  - linux.docker

nvidia-docker-repo:
  pkgrepo.managed:
    - humanname: 'nvidia-docker - Allows for Docker to use a GPU'
    - name: |
        deb https://nvidia.github.io/libnvidia-container/debian10/$(ARCH) /
        deb https://nvidia.github.io/nvidia-container-runtime/debian10/$(ARCH) /
        deb https://nvidia.github.io/nvidia-docker/debian10/$(ARCH) /
    - key_url: https://nvidia.github.io/nvidia-docker/gpgkey
    - file: /etc/apt/sources.list.d/nvidia-docker.list

nvidia-container-toolkit:
  pkg.installed:
    - require:
      - nvidia-docker-repo
