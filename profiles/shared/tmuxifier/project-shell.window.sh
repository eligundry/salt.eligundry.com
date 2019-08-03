# Shell window for {{ project }}.
# MANAGED BY SALT, DO NOT EDIT!!!

new_window "{{ project }}-shell"

{% if pre_cmd %}
run_cmd "{{ pre_cmd }}; clear"
{% endif %}

{% if is_webapp %}
split_h 50

{% if 'server' in webapp_cmds %}
{% if pre_cmd %}
run_cmd "{{ pre_cmd }}; clear"
{% endif %}
run_cmd "{{ webapp_cmds['server'] }}"
{% endif %}

{% if 'js_build' in webapp_cmds %}
split_v 50
{% if pre_cmd %}
run_cmd "{{ pre_cmd }}; clear"
{% endif %}
run_cmd "{{ webapp_cmds['js_build'] }}"
{% endif %}

{% endif %}

select_pane 0
