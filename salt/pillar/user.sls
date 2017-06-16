user:
  name: eligundry
  email: eligundry@gmail.com
  fullname: Eli Gundry
  password: $1$qWnmJliH$f.dbCqjLWef3MYikZLPcS1
  {% if grains['os'] == 'MacOS' %}
  shell: /usr/local/bin/zsh
  home: /Users/eligundry
  {% else %}
  shell: /usr/bin/zsh
  home: /home/eligundry
  {% endif %}
