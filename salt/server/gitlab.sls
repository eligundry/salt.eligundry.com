{% set gitlab_image = 'gitlab/gitlab-ce:latest' %}
{% set gitlab_logs = '/var/log/gitlab' %}
{% set gitlab_data = '/opt/gitlab/data' %}
{% set gitlab_config = '/opt/gitlab/config' %}
{% set gitlab_hostname = salt['pillar.get']('gitlab:hostname') %}
{% set pull_latest = pillar['docker_pull_latest'] %}
{% set website = pillar['website'] %}

{{ gitlab_logs }}:
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

{{ gitlab_data }}:
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

{{ gitlab_image }}:
  docker_image.present:
    - force_pull: {{ pull_latest }}

gitlab:
  docker_container.running:
    - image: {{ gitlab_image }}
    - hostname: {{ gitlab_hostname }}
    - environment:
      - VIRTUAL_HOST: {{ gitlab_hostname }}
      - VIRTUAL_PORT: 8929
      - LETSENCRYPT_HOST: {{ gitlab_hostname }}
      - LETSENCRYPT_EMAIL: {{ website['letsencrypt']['email'] }}
      - LETSENCRYPT_TEST: "{{ website['letsencrypt']['test'] }}"
    - ports:
      - "2289:22"
    - volumes:
      - {{ gitlab_config }}:/etc/gitlab
      - {{ gitlab_data }}:/var/opt/gitlab
      - {{ gitlab_logs }}:/var/log/gitlab
