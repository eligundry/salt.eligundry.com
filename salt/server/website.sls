{% set pull_latest = pillar['docker_pull_latest'] %}
{% set website = pillar['website'] %}
{% set eligundry_image = 'eligundry/eligundry.com' %}

{{ eligundry_image }}:
  docker_image.present:
    - force: {{ pull_latest }}

eligundry.com:
  docker_container.running:
    - image: {{ eligundry_image }}
    - environment:
      - VIRTUAL_HOST: {{ website['virtual_host'] }}
      - VIRTUAL_PORT: 8080
      - LETSENCRYPT_HOST: {{ website['letsencrypt']['host'] }}
      - LETSENCRYPT_EMAIL: {{ website['letsencrypt']['email'] }}
      - LETSENCRYPT_TEST: "{{ website['letsencrypt']['test'] }}"
      - ENABLE_IPV6: "true"
    - restart_policy: always
    - require:
      - nginx-proxy
      - {{ eligundry_image }}
