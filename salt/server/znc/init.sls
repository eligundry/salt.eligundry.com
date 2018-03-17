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

{{ znc_dir }}/configs/znc.conf:
  file.managed:
    - source: salt://server/znc/znc.conf
    - template: jinja
    - defaults:
        proxy_ip: {{ salt['cmd.run']("docker inspect --format '{{ .NetworkSettings.IPAddress }}' nginx-proxy") }}
        password_hash: {{ znc_config['password']['hash'] }}
        password_salt: {{ znc_config['password']['salt'] }}
    - require:
      - {{ znc_dir }}

{{ znc_image }}:
  docker_image.present:
    - force: {{ pull_latest }}

znc-irc-bouncer:
  docker_container.running:
    - image: {{ znc_image }}
    - binds:
      - {{ znc_dir }}:/znc-data
    - port_bindings:
      - "8888:8888"
    - environment:
      - VIRTUAL_HOST: {{ znc_config['host'] }}
      - VIRTUAL_PORT: 6667
      - LETSENCRYPT_HOST: {{ znc_config['host'] }}
      - LETSENCRYPT_EMAIL: "{{ znc_config['email'] }}"
      - LETSENCRYPT_TEST: "{{ znc_config['letsencrypt_test'] }}"
      - ENABLE_IPV6: "false"
    - restart_policy: always
    - watch:
      - file: {{ znc_dir }}/configs/znc.conf
    - require:
      - {{ znc_image }}
      - {{ znc_dir }}/configs/znc.conf
