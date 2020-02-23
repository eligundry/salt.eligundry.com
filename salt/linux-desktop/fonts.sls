{% set fonts_dir = pillar['user']['home'] + '/.fonts' %}
{% set user = pillar['user']['name'] %}

fonts-roboto:
  pkg.installed

ttf-ancient-fonts:
  pkg.installed

ttf-mscorefonts-installer:
  pkg.installed

fontforge:
  pkg.installed:
    - pkgs:
      - fontforge
      - python-fontforge

{{ fonts_dir }}:
  file.directory:
    - user: {{ user }}

{% for family, weights in salt['pillar.get']('fonts').items() %}
{% for weight, url in weights.items() %}

{{ fonts_dir }}/{{ family }}/{{ weight }}.otf:
  file.managed:
    - source: {{ url }}
    - user: {{ user }}
    - makedirs: true
    - require:
      - {{ fonts_dir }}

{% endfor %}
{% endfor %}
