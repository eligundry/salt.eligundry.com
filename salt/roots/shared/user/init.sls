{% set user = pillar['user'] %}
{% set is_linux = (grains['kernel'] == 'Linux') %}

{{ user['name'] }}:
  user.present:
    - fullname: {{ user['fullname'] }}
    - shell: {{ user['shell'] }}
    - createhome: True
    {% if is_linux %}
    - groups:
      - sudo
      - users
      - docker
    - require:
      - docker-group
    {% endif %}

{% for name in user['ssh_keys'] %}
{{ pillar['home'] }}/.ssh/{{ name }}:
  file.managed:
    - user: {{ user['name'] }}
    - mode: 600
    - contents_pillar: user:ssh_keys:{{ name }}
    - show_changes: False
{% endfor %}

{{ pillar['home'] }}/.ssh/config:
  file.managed:
    - user: {{ user['name'] }}
    - mode: 600
    - source: salt://shared/user/ssh_config
    - template: jinja
    - require:
      - {{ user['name'] }}

{{ pillar['home'] }}/.ssh/config.local:
  file.managed:
    - user: {{ user['name'] }}
    - mode: 600

salt-master-gpg-key:
  gpg.present:
    - name: {{ pillar['salt-master-gpg']['id'] }}
    - keyserver: {{ pillar['salt-master-gpg']['server'] }}
    - user: {{ user['name'] }}
    - require:
      - {{ user['name'] }}
