{% set v = '3.7.0' %}

mattermost:
  pkg.absent
  # pkg.installed:
  #   - sources:
  #     - mattermost-desktop: 'https://releases.mattermost.com/desktop/{{ v }}/mattermost-desktop-{{ v }}-linux-amd64.deb'
