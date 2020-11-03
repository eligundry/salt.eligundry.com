user:
  name: eligundry
  email: eligundry@gmail.com
  fullname: Eli Gundry
  ssh_keys: {}
  ssh_aliases: {}
  gpg_keys:
    private: {}
    public: {}
  pass: None
  github:
    username: None
    access_token: None
  {% if grains['os'] == 'MacOS' %}
  shell: /bin/zsh
  home: /Users/eligundry
  main_group: staff
  {% else %}
  shell: /usr/bin/zsh
  home: /home/eligundry
  main_group: eligundry
  {% endif %}

dots:
  name: eligundry
  {% if grains['os'] == 'MacOS' %}
  home: /Users/eligundry
  {% else %}
  home: /home/eligundry
  {% endif %}
