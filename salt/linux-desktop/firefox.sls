# Debian has decided to only provide an extended release for Firefox. I would
# like to be able to upgrade more than every 6 months because I'm not insane.
{% if grains['os'] == 'Debian' %}

firefox:
  pkg.installed:
    - sources:
      - firefox: 'https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US'

firefox-esr:
  pkg.installed

{% else %}

firefox:
  pkg.installed

{% endif %}
