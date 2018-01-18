{% set config_dir = '~/.tmuxifier-sessions' %}

{% for dst, repo in pillar['repos'].items() %}

{% set project = dst.split('/')[-1] %}
{% set tmuxifier = repo['tmuxifier'] %}

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
      - pre_cmd: {{ tmuxifier.get('pre_cmd', False) }}
      - is_webapp: {{ tmuxifier.get('webapp', False) }}
      - webapp_cmds: {{ tmuxifier.get('webapp_cmds') }}

tmuxifier-nvim-{{ project }}:
  file.managed:
    - name: {{ config_dir }}/{{ project }}-nvim.session.sh
    - source: salt://shared/tmuxifier/nvim.window.sh
    - user: {{ pillar['user']['name'] }}
    - makedirs: True
    - template: jinja
    - context:
      - project: {{ project }}
      - dir: {{ dst }}
      - pre_cmd: {{ tmuxifier.get('pre_cmd', False) }}
      - is_webapp: {{ tmuxifier.get('webapp', False) }}
      - webapp_cmds: {{ tmuxifier.get('webapp_cmds') }}

tmuxifier-shell-{{ project }}:
  file.managed:
    - name: {{ config_dir }}/{{ project }}-project-shell.session.sh
    - source: salt://shared/tmuxifier/project-shell.window.sh
    - user: {{ pillar['user']['name'] }}
    - makedirs: True
    - template: jinja
    - context:
      - project: {{ project }}
      - dir: {{ dst }}
      - pre_cmd: {{ tmuxifier.get('pre_cmd', False) }}
      - is_webapp: {{ tmuxifier.get('webapp', False) }}
      - webapp_cmds: {{ tmuxifier.get('webapp_cmds') }}

{% endfor %}
