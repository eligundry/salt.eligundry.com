us_locale:
  locale.present:
    - name: en_US.UTF-8

{% if grains['os'] != 'MacOS' %}
default_locale:
  locale.system:
    - name: en_US.UTF-8
{% endif %}

America/New_York:
  timezone.system:
    - utc: True

# /etc/hostname:
#   file.managed:
#     - contents_grains: id
#     - user: root
#     - group: root
#     - mode: 644
#     - create: False

hostname:
  network.system:
    - hostname: {{ grains['id'] }}
    - apply_hostname: True
    - retain_settings: True
