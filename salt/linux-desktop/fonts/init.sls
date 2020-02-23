{% set home = pillar['user']['home'] %}
{% set fonts_dir = home + '/.fonts' %}
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

{{ home }}/.config/fontconfig/fonts.conf:
  file.managed:
    - source: salt://linux-desktop/fonts/fonts.conf
    - user: {{ user }}

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
    - skip_verify: true
    - require:
      - {{ fonts_dir }}

{% endfor %}
{% endfor %}