{% set slack_version = '3.3.7' %}

slack:
  pkg.installed:
    - sources:
      - slack-desktop: 'https://downloads.slack-edge.com/linux_releases/slack-desktop-{{ slack_version }}-amd64.deb'
