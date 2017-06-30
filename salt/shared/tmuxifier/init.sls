{% set config_dir = '~/.tmuxifier-sessions' %}

{% for dst in pillar['repos'] %}

{% set project = dst.split('/')[-1] %}

tmuxifier-session-{{ project }}:
  file.managed:
    - name: {{ config_dir }}/{{ project }}.session.sh
    - source: salt://shared/tmuxifier/code-session.sh
    - user: {{ pillar['user']['name'] }}
    - makedirs: True
    - template: jinja
    - context:
      - project: {{ project }}
      - dir: {{ dst }}

{% endfor %}
