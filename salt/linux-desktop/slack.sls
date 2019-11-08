{% set slack_version = '4.1.2' %}

slack:
  pkg.installed:
    - sources:
      - slack-desktop: 'https://downloads.slack-edge.com/linux_releases/slack-desktop-{{ slack_version }}-amd64.deb'
