include:
  - linux.docker

{% set filename = '/etc/apt/sources.list.d/nvidia-docker.list' %}

nvidia-docker-repo:
  pkgrepo.managed:
    - humanname: 'nvidia-docker - Allows for Docker to use a GPU'
    - name: 'deb https://nvidia.github.io/libnvidia-container/debian10/$(ARCH) /'
    - key_url: https://nvidia.github.io/nvidia-docker/gpgkey
    - file: {{ filename }}
    - clean_file: true

{{ filename }}:
  file.append:
    - text:
      - 'deb https://nvidia.github.io/nvidia-container-runtime/debian10/$(ARCH) /'
      - 'deb https://nvidia.github.io/nvidia-docker/debian10/$(ARCH) /'

nvidia-container-toolkit:
  pkg.installed:
    - require:
      - nvidia-docker-repo
