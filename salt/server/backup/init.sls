# Backup crucial files to Digital Ocean Spaces

{% set backup_scripts_dir = "/opt/backup-scripts" %}

cron-digital-ocean-spaces-key:
  cron.env_present:
    - name: AWS_ACCESS_KEY_ID
    - value: {{ salt['pillar.get']('digitalocean:spaces:access_key') }}
    - user: root

cron-digital-ocean-spaces-secret:
  cron.env_present:
    - name: AWS_SECRET_ACCESS_KEY
    - value: {{ salt['pillar.get']('digitalocean:spaces:secret_key') }}
    - user: root

cron-digital-ocean-spaces-bucket:
  cron.env_present:
    - name: DO_SPACES_BUCKET
    - value: {{ salt['pillar.get']('digitalocean:spaces:bucket') }}
    - user: root

cron-digital-ocean-spaces-endpoint:
  cron.env_present:
    - name: DO_SPACES_ENDPOINT
    - value: {{ salt['pillar.get']('digitalocean:spaces:endpoint') }}
    - user: root

{{ backup_scripts_dir }}:
  file.recurse:
    - source: salt://server/backup/scripts
    - user: root
    - group: root
    - file_mode: 755

cron-backup-website-database:
  cron.present:
    - comment: "Backup the website's database daily to a bucket. Retention is 1 month."
    - name: {{ backup_scripts_dir }}/database.sh
    - special: "@daily"
    - user: root
    - require:
      - {{ backup_scripts_dir }}
