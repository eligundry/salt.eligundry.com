{% set pass_repo = salt['pillar.get']('user:pass') %}
{% set user = salt['pillar.get']('user:name') %}
{% set group = salt['pillar.get']('user:main_group', user) %}
{% set home = salt['pillar.get']('user:home') %}
{% set password_store = home + '/.password-store' %}
{% set browserpass_platform = 'linux64' %}
{% set browserpass_native_version = '3.0.5' %}

{% if grains['os'] == 'MacOS' %}
  {% set browserpass_platform = 'darwin64' %}
{% endif %}

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

{{ password_store }}:
  file.directory:
    - user: {{ user }}
    - group: {{ group }}
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
    - group: {{ group }}
    - mode: 774
    - require:
      - {{ pass_repo }}
      - {{ password_store }}

{% if salt['grains.get']('eligundry_device') != 'server' %}

{{ home }}/.lib/browserpass:
  file.directory:
    - user: {{ user }}
    - group: {{ group }}
    - makedirs: true

browserpass-library:
  archive.extracted:
    - name: {{ home }}/.lib/browserpass
    - source: 'https://github.com/browserpass/browserpass-native/releases/download/{{ browserpass_native_version }}/browserpass-{{ browserpass_platform }}{{ browserpass_native_version }}.tar.gz'
    - skip_verify: true
    - overwrite: true
    - user: {{ user }}
    - group: {{ group }}
    - enforce_toplevel: false

{% for browser in ['chrome', firefox] %}

browserpass-install-{{ browser }}-native-host:
  cmd.run:
    - name: cd {{ home }}/.lib/browserpass && make hosts-{{ browser }}-user
    - runas: {{ user }}
    - require:
      - browserpass-library

{% if browser != 'firefox' %}

browserpass-install-{{ browser }}:
  cmd.run:
    - name: cd {{ home }}/.lib/browserpass && make policies-{{ browser }}-user
    - runas: {{ user }}
    - require:
      - browserpass-install-{{ browser }}-native-host

{% endif %}

{% endfor %}

{% endif %}

{% endif %}
