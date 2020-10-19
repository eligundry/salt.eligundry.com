{% set os = grains['os']|lower %}
{% set codename = grains['lsb_distrib_codename'] %}

{% if os == 'debian' %}
  {% set codename = 'jessie' %}
{% endif %}

slack-ppa:
  pkgrepo.managed:
    - humanname: Slack
    - name: deb https://packagecloud.io/slacktechnologies/slack/{{ os }}/ {{ codename }} main
    - key_url: https://packagecloud.io/slacktechnologies/slack/gpgkey
    - file: /etc/apt/sources.list.d/slack.list
    - clean_file: true

slack:
  pkg.installed:
    - name: slack-desktop

