{% set user = pillar['user'] %}
{% set is_linux = (grains['kernel'] == 'Linux') %}

{{ user['name'] }}:
  user.present:
    - fullname: {{ user['fullname'] }}
    # - password: {{ user['password'] }}
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
    - user: {{ user }}
    - mode: 600
    - contents_pillar: user:ssh_keys:{{ name }}
{% endfor %}
