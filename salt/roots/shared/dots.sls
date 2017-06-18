{% set user = pillar['user']['name'] %}
{% set home = pillar['user']['home'] %}
{% set dots = home + '/dots' %}
{% set lib = home + '/.lib' %}

dots-repo:
  git.latest:
    - name: git@github.com:eligundry/dots.git
    - submodules: True
    - target: {{ dots }}
    - user: {{ user }}
    - require:
      - {{ user }}

{{ lib }}:
  file.directory:
    - user: {{ user }}

{% for target, repo in pillar['dots_libs'].items() %}
dots-lib-{{ target }}:
  git.latest:
    - name: {{ repo }}
    - target: {{ lib }}/{{ target }}
    - user: {{ user }}
    - require:
      - {{ lib }}
{% endfor %}

{% for dst, src in pillar['dots'].items() %}
{{ home }}/{{ dst }}:
  file.symlink:
    - target: {{ dots }}/{{ src }}
    - user: {{ user }}
    - makedirs: True
    - force: True
    - require:
      - dots-repo
{% endfor %}
