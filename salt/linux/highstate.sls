# daily-highstate:
#   cron.present:
#     - special: '@daily'
#     - name: 'salt-call state.highstate'
#     - comment: "Highstate the system daily. Poor man's build server."

# @TODO salt-call is finishing but not exiting cleanly, causing this to pile up
# on the server. Disabling until I can find a better way.
daily-highstate:
  cron.absent:
    - special: '@daily'
    - name: 'salt-call state.highstate'
    - comment: "Highstate the system daily. Poor man's build server."
