{% set os = grains['os']|lower %}

{% if os == 'debian' %}

{% set codename = 'jessie' %}

slack-ppa:
  pkgrepo.managed:
    - humanname: Slack
    - name: deb https://packagecloud.io/slacktechnologies/slack/{{ os }}/ {{ codename }} main
    - key_url: https://packagecloud.io/slacktechnologies/slack/gpgkey
    - file: /etc/apt/sources.list.d/slack.list
    - clean_file: true

slack:
  pkg.installed

{% endif %}
