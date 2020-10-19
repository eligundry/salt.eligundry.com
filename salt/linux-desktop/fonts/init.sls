{% set home = pillar['user']['home'] %}
{% set fonts_dir = home + '/.fonts' %}
{% set user = pillar['user']['name'] %}

fonts-roboto:
  pkg.installed

# Used to be that you needed to install this to get emoji. It looked terrible
# but it was the only option. But now, times have changed and emojis are first
# class citizens.
ttf-ancient-fonts:
  pkg.removed

fonts-noto-color-emoji:
  pkg.installed

ttf-mscorefonts-installer:
  pkg.installed

{{ home }}/.config/fontconfig/fonts.conf:
  file.managed:
    - source: salt://linux-desktop/fonts/fonts.conf
    - user: {{ user }}
    - makedirs: true

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
