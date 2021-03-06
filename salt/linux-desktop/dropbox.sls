# This is being annoying in Debian bullseye
# Honestly, I don't event need a GUI for this.
# Let's do it through Docker!
#
# {% set os = grains['os']|lower %}
# {% set codename = grains['lsb_distrib_codename'] %}
#
# {% if codename == 'bullseye' %}
#   {% set codename = 'buster' %}
# {% endif %}
#
# dropbox-ppa:
#   pkgrepo.managed:
#     - humanname: Dropbox
#     - name: deb http://linux.dropbox.com/{{ os }}/ {{ codename }} main
#     - keyid: 5044912E
#     - keyserver: pgp.mit.edu
#     - file: /etc/apt/sources.list.d/dropbox.list
#
# dropbox:
#   pkg.installed:
#     - require:
#       - dropbox-ppa

{% set dropbox_image = 'otherguy/dropbox' %}
{% set dropbox_path = pillar['user']['home'] + '/Dropbox' %}

{{ dropbox_path }}:
  file.directory:
    - user: {{ pillar['user']['name'] }}
    - group: {{ pillar['user']['name'] }}

dropbox_settings:
  docker_volume.present

{{ dropbox_image }}:
  docker_image.present:
    - force: true

dropbox:
  docker_container.running:
    - image: {{ dropbox_image }}
    - restart_policy: always
    - environment:
      - DROPBOX_UID: '1000'
      - DROPBOX_GID: '1000'
    - binds:
      - {{ dropbox_path }}:/opt/dropbox/Dropbox
      - dropbox_settings:/opt/dropbox/.dropbox
