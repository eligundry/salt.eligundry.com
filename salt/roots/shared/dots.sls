{% set user = pillar['user']['name'] %}
{% set home = pillar['user']['home'] %}
{% set dots = home + '/dots' %}
{% set lib = home + '/.lib' %}

dots-repo:
  git.latest:
    - name: https://github.com/eligundry/dots.git
    - submodules: True
    - target: {{ dots }}
    - user: {{ user }}
    - require:
      - {{ user }}

{{ lib }}:
  file.directory:
    - user: {{ user }}

zplug:
  git.latest:
    - name: https://github.com/zplug/zplug.git
    - target: {{ lib }}/zplug
    - user: {{ user }}
    - require:
      - {{ lib }}

tmuxifier:
  git.latest:
    - name: https://github.com/jimeh/tmuxifier.git
    - target: {{ lib }}/tmuxifier
    - user: {{ user }}
    - require:
      - {{ lib }}

base16-shell:
  git.latest:
    - name: https://github.com/chriskempson/base16-shell.git
    - target: {{ lib }}/base16-shell
    - user: {{ user }}
    - require:
      - {{ lib }}

base16-terminal-app:
  git.latest:
    - name: https://github.com/korzhyk/base16-terminal-app.git
    - target: {{ lib }}/base16-terminal-app
    - user: {{ user }}
    - require:
      - {{ lib }}

pipes:
  git.latest:
    - name: https://github.com/pipeseroni/pipes.sh.git
    - target: {{ lib }}/pipes
    - user: {{ user }}
    - require:
      - {{ lib }}

{% for src, dst in pillar['dots'].items() %}
{{ home }}/{{ dst }}:
  file.symlink:
    - target: {{ dots }}/{{ src }}
    - user: {{ user }}
    - makedirs: True
    - force: True
    - require:
      - dots-repo
{% endfor %}
