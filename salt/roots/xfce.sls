{% set user = pillar['user']['name'] %}

xfce4-customize:
  cmd.run:
    - name: /srv/salt/configs/customize-xfce.sh
    - runas: {{ user }}
    - cwd: /home/{{ user }}
    - require:
      - {{ user }}
