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
    - identity: {{ home }}/.ssh/no_pass

{{ lib }}:
  file.directory:
    - user: {{ user }}

{% for target, repo in pillar['dots_libs'].items() %}

dots-lib-{{ target }}:
  git.latest:
    - name: {{ repo }}
    - target: {{ lib }}/{{ target }}
    - user: {{ user }}
    - identity: {{ home }}/.ssh/no_pass
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

{% for dst, src in pillar['dots_absent'].items() %}

{{ home }}/{{ dst }}:
  file.absent:
    - require:
      - dots-repo

{% endfor %}
