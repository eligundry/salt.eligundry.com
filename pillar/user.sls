user:
  name: eligundry
  email: eligundry@gmail.com
  fullname: Eli Gundry
  ssh_keys: {}
  ssh_aliases: {}
  gpg_keys:
    private: {}
    public: {}
  {% if grains['os'] == 'MacOS' %}
  shell: /usr/local/bin/zsh
  home: /Users/eligundry
  {% else %}
  shell: /usr/bin/zsh
  home: /home/eligundry
  {% endif %}
