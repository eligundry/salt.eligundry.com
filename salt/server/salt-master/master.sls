# Bind the salt master to a Tailscale IP
interface: {{ salt_master['interface'] }}

# Run as root
user: root

# Allow Linux users to authenticate with the API via PAM
auth.pam.service: login

# The external auth system uses the Salt auth modules to authenticate and
# validate users to access areas of the Salt system.
external_auth:
  pam:
    {{ pillar['user']['name'] }}:
      - '.*'
  {% for user in pillar['salt-api']['users'] %}
    {{ user['name'] }}:
      - '.*'
  {% endfor %}

# REST API 4 Salt
rest_cherrypy:
  port: 6969
  disable_ssl: true

# All of the secret configs go in here
file_roots:
  base:
    - /srv/salt
    - /srv/formulas

# When using multiple environments, each with their own top file, the
# default behaviour is an unordered merge. To prevent top files from
# being merged together and instead to only use the top file from the
# requested environment, set this value to 'same'.
top_file_merging_strategy: same

# Allow git repos for salt
fileserver_backend:
  - git
  - roots

# Git File Server Backend Configuration
gitfs_provider: pygit2

# All of the git repos
gitfs_remotes:
  - git://github.com/saltstack-formulas/apt-formula.git
  - git://github.com/saltstack-formulas/nfs-formula.git
  - git://github.com/saltstack-formulas/openssh-formula.git
  - git://github.com/saltstack-formulas/samba-formula.git
  - git://github.com/saltstack-formulas/sudoers-formula.git
  - git://github.com/saltstack-formulas/users-formula.git
  - git://github.com/eligundry/salt.eligundry.com.git:
    - root: salt
    - name: eligundry
    - saltenv:
      - base:
        - ref: {{ eligundry_branch }}
  - git://github.com/eligundry/dots.git:
    - root: saltstack
    - name: dots
    - saltenv:
      - base:
        - ref: master

# Use the pillar in this repo as a base
pillar_roots:
  base:
    - /srv/pillar

ext_pillar:
  - git:
    - {{ eligundry_branch }} https://github.com/eligundry/salt.eligundry.com.git:
      - env: base
      - root: pillar
    - master https://github.com/eligundry/dots.git:
      - env: base
      - root: saltstack/pillar

# The ext_pillar_first option allows for external pillar sources to populate
# before file system pillar. This allows for targeting file system pillar from
# ext_pillar.
ext_pillar_first: True
git_pillar_env: base
