{% set user = pillar['user']['name'] %}
{% set home = '/home/' + user %}
{% set dots = home + '/dots' %}

dots-repo:
  git.latest:
    - name: https://github.com/eligundry/dots.git
    - submodules: True
    - target: {{ dots }}
    - user: {{ user }}
    - require:
      - {{ user }}

oh-my-zsh:
  git.latest:
    - name: https://github.com/robbyrussell/oh-my-zsh.git
    - submodules: True
    - target: {{ home }}/.oh-my-zsh
    - user: {{ user }}
    - require:
      - {{ user }}

{% for src, dst in pillar['dots'].items() %}
{{ home }}/{{ dst }}:
  file.symlink:
    - target: {{ dots }}/{{ src }}
    - user: {{ user }}
    - group: {{ user }}
    - makedirs: True
    - force: True
    - require:
      - dots-repo
{% endfor %}
