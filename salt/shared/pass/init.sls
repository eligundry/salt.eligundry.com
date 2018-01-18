{% if salt['pillar.get']('user:pass') %}

{% set home = pillar['user']['home'] %}
{% set password_store = home + '/.password_store' %}

pass:
  pkg.installed

{{ pillar['user']['pass'] }}:
  git.latest:
    - target: {{ password_store }}
    - user: {{ pillar['user']['name'] }}
    - identity: {{ home }}/.ssh/no_pass
    - require:
      - git
      - {{ home }}/.ssh/no_pass

pass-git-push-after-commit:
  file.managed:
    - name: {{ password_store }}/.git/hooks/post-commit
    - source: salt://shared/pass/post-commit.sh
    - user: {{ pillar['user']['name'] }}
    - mode: 774
    - require:
      - {{ pillar['user']['pass'] }}

{% endif %}
