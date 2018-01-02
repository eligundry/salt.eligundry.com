{% if grains['os'] == 'MacOS' %}

awscli:
  pkg.installed

{% else %}

aws.cli:
  pip.installed:
    - user: root

{% endif %}
