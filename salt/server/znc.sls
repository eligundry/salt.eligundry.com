{% set znc_image = 'znc:latest' %}
{% set znc_dir = '/opt/znc' %}
{% set pull_latest = pillar['docker_pull_latest'] %}

{{ znc_dir }}:
  file.directory:
    - user: docker
    - group: docker
    - dir_mode: 775
    - file_mode: 660
    - makedirs: True
    - recurse:
      - user
      - group
      - mode

{{ znc_image }}:
  docker_image.present:
    - force: {{ pull_latest }}

znc-irc-bouncer:
  docker_container.running:
    - image: {{ znc_image }}
    - binds:
      - {{ znc_dir }}:/znc-data
    - port_bindings:
      - "6667:6667"
    - require:
      - {{ znc_image }}
