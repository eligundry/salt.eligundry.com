{% set znc_image = 'znc:latest' %}
{% set znc_dir = '/opt/znc' %}
{% set znc_config = pillar['znc'] %}
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
      - "65534:65534"
    # - environment:
      # - VIRTUAL_HOST: {{ znc_config['host'] }}
      # - VIRTUAL_PORT: 65534
      # - LETSENCRYPT_HOST: {{ znc_config['host'] }}
      # - LETSENCRYPT_EMAIL: {{ znc_config['email'] }}
      # - LETSENCRYPT_TEST: {{ znc_config['letsencrypt_test'] }}
      # - ENABLE_IPV6: "true"
    - require:
      - {{ znc_image }}
