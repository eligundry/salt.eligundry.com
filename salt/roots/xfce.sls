{% set user = pillar['user']['name'] %}

xfce4_customize:
  cmd.run:
    - name: /srv/salt/configs/customize-xfce.sh
    - runas: {{ user }}
    - cwd: /home/{{ user }}
