desktop-environments:
  pkg.installed:
    - pkgs:
      - gnome
      - xfce4

desktop-pkgs:
  pkg.installed:
    - pkgs:
      - clementine
      - evince
      - fonts-roboto
      - gimp
      - gnome-do
      - gparted
      - qt4-qtconfig
      - redshift-gtk
      - thunderbird
      - transmission
      - ttf-ancient-fonts
      - ttf-mscorefonts-installer
      - xfce4-goodies
      {% if grains['os'] == 'Debian' %}
      - firefox-esr
      {% else %}
      - firefox
      {% endif %}

desktop-development-pkgs:
  pkg.installed:
    - pkgs:
      - mysql-workbench
      - pgadmin3
      - postgresql-client
