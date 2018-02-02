{% set pass_repo = salt['pillar.get']('user:pass') %}
{% set user = salt['pillar.get']('user:name') %}
{% set home = salt['pillar.get']('user:home') %}
{% set password_store = home + '/.password-store' %}

{% if pass_repo %}

pass:
  pkg.installed

qtpass:
  pkg.removed

{{ pass_repo }}:
  git.latest:
    - target: {{ password_store }}
    - user: {{ user }}
    - identity: {{ home }}/.ssh/no_pass
    - require:
      - git
      - {{ home }}/.ssh/no_pass

{{ password_store }}:
  file.directory:
    - user: {{ user }}
    - dir_mode: 775
    - file_mode: 660
    - recurse:
      - user
      - group
      - mode
    - require:
      - {{ pass_repo }}

pass-git-push-after-commit:
  file.managed:
    - name: {{ password_store }}/.git/hooks/post-commit
    - source: salt://shared/pass/post-commit.sh
    - user: {{ user }}
    - mode: 774
    - require:
      - {{ pass_repo }}
      - {{ password_store }}

{% endif %}
