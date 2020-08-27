# Adapted from here https://github.com/deviantony/docker-elk/blob/master/docker-stack.yml

include:
  - server.https-portal

{% set pull_latest = pillar['docker_pull_latest'] %}
{% elasticsearch_image = 'docker.elastic.co/elasticsearch/elasticsearch:7' %}
{% logstash_image = 'docker.elastic.co/logstash/logstash:7' %}
{% kibana_image = 'docker.elastic.co/kibana/kibana:7' %}

{% for image in [elasticsearch_image, logstash_image, kibana_image] %}

{{ image }}:
  docker_image.present:
    - force: {{ pull_latest }}

{% endfor %}

elasticsearch:
  docker_container.running:
    - image: {{ elasticsearch_image }}
    - environment:
      - ES_JAVA_OPTS: '-Xmx256m -Xms256m'
      - ELASTIC_PASSWORD: changeme
      - discovery.type: single-node
    - restart_policy: always
    - networks:
      - https-portal-network:
        - aliases:
          - elasticsearch
    - require:
      - {{ elasticsearch_image }}
      - https-portal-network

logstash:
  docker_container.running:
    - image: {{ logstash_image }}
    - restart_policy: always
    - networks:
      - aliases:
        - logstash
    - require:
      - {{ logstash_image }}
      - https-portal-network

kibana:
  docker_container.running:
    - image: {{ kibana_image }}
    - restart_policy: always
    - networks:
      - aliases:
        - kibana
    - require:
      - {{ kibana_image }}
      - https-portal-network
