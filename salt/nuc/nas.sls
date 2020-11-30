{% set home = pillar['user']['home'] %}
{% set user = pillar['user']['name'] %}
{% set mountpoint = "/mnt/queensbridge" %}

nfs-common:
  pkg.installed

{{ mountpoint }}:
  mount.mounted:
    - device: queensbridge:/nfs/eligundry
    - fstype: nfs
    - mkmnt: true
    - persist: true
    - mount: true

{% for home_path_to_link_to_nas in ['Dropbox', 'Music'] %}

{{ home }}/{{ home_path_to_link_to_nas }}:
  file.symlink:
    - target: {{ mountpoint }}/{{ home_path_to_link_to_nas }}
    - force: true
    - user: {{ user }}
    - group: {{ user }}
    - require:
      - {{ mountpoint }}

{% endfor %}
