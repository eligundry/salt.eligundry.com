# Traefik is an auto templating reverse proxy that supports wildcard SSL support
# through LetsEncrypt. This will provide all routing for the various containers
# on the server.

{% set traefik_image = 'library/traefik' %}
{% set traefik_dir = '/opt/traefik' %}
{% set letsencrypt = pillar['letsencrypt'] %}
{% set cloudflare = pillar['cloudflare'] %}

{{ traefik_dir }}:
  file.directory:
    - user: docker
    - group: docker
    - dir_mode: 775
    - file_mode: 660
    - makedirs: true
    - recurse:
      - user
      - group
      - mode

{{ traefik_dir }}/acme.json:
  file.managed

{{ traefik_dir }}/traefik.toml:
  file.managed:
    - source: salt://server/traefik/config.toml
    - user: docker
    - group: docker
    - file_mode: 660
    - defaults:
      - letsencrypt: {{ letsencrypt }}

{{ traefik_image }}:
  docker_image.present:
    - force_pull: {{ pull_latest }}

traefik:
  docker_container.running:
    - image: {{ traefik_image }}
    - command: --api --docker
    - environment:
      - CLOUDFLARE_EMAIL: {{ cloudflare['email'] }}
      - CLOUDFLARE_API_KEY: {{ cloudflare['api_key'] }}
    - port_bindings:
      - "80:80"
      - "443:443"
      - "8080:8080"
    - binds:
      - /var/run/docker.sock:/var/run/docker.sock
      - {{ traefik_dir }}/acme.json:/acme.json
      - {{ traefik_dir }}/traefik.toml:/traefik.toml
