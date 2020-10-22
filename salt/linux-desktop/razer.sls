{% set user = salt['pillar.get']('user') %}

openrazer-ppa:
  pkgrepo.managed:
    - humanname: OpenRazer
    {% if grains['osfullname'] == 'Debian' %}
    - name: 'deb http://download.opensuse.org/repositories/hardware:/razer/Debian_{{ grains['lsb_distrib_release']|capitalize }}/ /'
    - key_url: https://download.opensuse.org/repositories/hardware:razer/Debian_Unstable/Release.key
    {% else %}
    - name: 'deb http://ppa.launchpad.net/openrazer/stable/ubuntu {{ grains['oscodename'] }} main'
    - keyid: 903936CAB6049E2E6C33D5D8073E051D7B2AEE37
    - keyserver: keyserver.ubuntu.com
    {% endif %}
    - file: /etc/apt/sources.list.d/openrazer.list

openrazer:
  pkg.installed:
    - name: openrazer-meta
    - require:
      - openrazer-ppa

polychromatic-ppa:
  pkgrepo.managed:
    - humanname: Polychromatic - GUI to style Razer devices
    - name: 'deb http://ppa.launchpad.net/polychromatic/stable/ubuntu focal main'
    - keyid: 96B9CD7C22E2C8C5
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/polychromatic.list

polychromatic:
  pkg.installed:
    - require: 
      - openrazer
      - polychromatic-ppa

disable-battery-notification:
  file.managed:
    - name: {{ user['home'] }}/.config/openrazer/razer.conf
    - user: {{ user['name'] }}
    - group: {{ user['name'] }}
    - makedirs: true
    - contents: |
        [General]
        # Verbose logging (logs debug messages - lotsa spam)
        verbose_logging = False
        
        [Startup]
        # Set the sync effects flag to true so any assignment of effects will work across devices
        sync_effects_enabled = True
        
        # Turn off the devices when the systems screensaver kicks in
        devices_off_on_screensaver = True
        
        # Mouse battery notifier
        mouse_battery_notifier = True
        
        [Statistics]
        # Collects number of keypresses per hour per key used to generate a heatmap
        key_statistics = True


quiet-down-battery-notifications:
  file.replace:
    - name: /usr/lib/python3/dist-packages/openrazer_daemon/misc/battery_notifier.py
    - pattern: 'INTERVAL_FREQ = 60 \* 10'
    - repl: 'INTERVAL_FREQ = 60 * 60'
