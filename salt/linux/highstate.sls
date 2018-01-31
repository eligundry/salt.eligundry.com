daily-highstate:
  cron.present:
    - special: '@daily'
    - name: 'salt-call state.highstate'
    - comment: "Highstate the system daily. Poor man's build server."
