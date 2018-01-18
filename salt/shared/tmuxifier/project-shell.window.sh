# Shell window for {{ project }}.
# MANAGED BY SALT, DO NOT EDIT!!!

new_window "{{ project }}-shell"

{% if pre_cmd %}
run_cmd "{{ pre_cmd }}"
run_cmd "clear"
{% endif %}

{% if is_webapp %}
split_h 50

{% if 'server' in webapp_cmds %}
{% if pre_cmd %}
run_cmd "{{ pre_cmd }}"
run_cmd "clear"
{% endif %}
run_cmd "{{ webapp_cmds['server'] }}"
{% endif %}

{% if 'js_build' in webapp_cmds %}
split_v 50
{% if pre_cmd %}
run_cmd "{{ pre_cmd }}"
run_cmd "clear"
{% endif %}
run_cmd "{{ webapp_cmds['js_build'] }}"
{% endif %}

{% endif %}

# Split window into panes.
#split_v 20
#split_h 50

# Run commands.
#run_cmd "top"     # runs in active pane
#run_cmd "date" 1  # runs in pane 1

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
select_pane 0
