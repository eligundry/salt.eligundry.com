{% set home = pillar['user']['home'] %}

pass:
  pkg.installed

{{ pillar['user']['pass'] }}:
  git.latest:
    - target: {{ home }}/.password-store
    - user: {{ pillar['user']['name'] }}
    - identity: {{ home }}/.ssh/no_pass
    - require:
      - git
      - {{ home }}/.ssh/no_pass

pass-git-push-after-commit:
  file.managed:
    - name: {{ home }}/.password-store/.git/hooks/post-commit
    - source: salt://shared/pass/post-commit.sh
    - user: {{ pillar['user']['name'] }}
    - mode: 774
