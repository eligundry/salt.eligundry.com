{% set pass_repo = salt['pillar.get']('user:pass') %}
{% set user = salt['pillar.get']('user:name') %}
{% set group = salt['pillar.get']('user:main_group', user) %}
{% set home = salt['pillar.get']('user:home') %}
{% set password_store = home + '/.password-store' %}
{% set browserpass_platform = 'linux64' %}

{% if grains['os'] == 'MacOS' %}
  {% set browserpass_platform = 'darwinx64' %}
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
    - source: 'https://github.com/dannyvankooten/browserpass/releases/download/2.0.13/browserpass-{{ browserpass_platform }}.zip'
    - skip_verify: true
    - overwrite: true
    - user: {{ user }}
    - group: {{ group }}
    - enforce_toplevel: false

browserpass-install-chrome:
  cmd.run:
    - name: {{ home }}/.lib/browserpass/install.sh chrome
    - runas: {{ user }}
    - unless: test -f {{ home }}/.config/google-chrome/NativeMessagingHosts/com.dannyvankooten.browserpass.json
    - require:
      - browserpass-library

browserpass-install-firefox:
  cmd.run:
    - name: {{ home }}/.lib/browserpass/install.sh firefox
    - runas: {{ user }}
    - unless: test -f {{ home }}/.mozilla/native-messaging-hosts/com.dannyvankooten.browserpass.json
    - require:
      - browserpass-library

{% endif %}

{% endif %}
