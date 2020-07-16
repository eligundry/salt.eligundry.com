{% set os = grains['os']|lower %}
{% set codename = grains['lsb_distrib_codename'] %}

tailscale-ppa:
  pkgrepo.managed:
    - humanname: Tailscale
    - name: deb https://pkgs.tailscale.com/stable/{{ os }} {{ codename }} main
    - key_url: https://pkgs.tailscale.com/stable/{{ os }}/{{ codename }}.gpg
    - file: /etc/apt/sources.list.d/tailscale.list

tailscale:
  pkg.installed

# To bring up run `sudo tailscale up`
# @TODO make sure the systemd unit is running
