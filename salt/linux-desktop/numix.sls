numix:
  pkg.installed:
    - pkgs:
      - numix-gtk-theme
      - numix-icon-theme
      {% if grains['os'] == 'Debian' %}
      - numix-icon-theme-circle
      {% endif %}
    - require:
      - numix-ppa
