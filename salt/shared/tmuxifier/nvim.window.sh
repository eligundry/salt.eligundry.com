# nvim window for {{ project }}.
# MANAGED BY SALT, DO NOT EDIT!!!

new_window "nvim"

{% if pre_cmd %}
run_cmd "{{ pre_cmd }}"
run_cmd "clear"
{% endif %}

run_cmd "nvim"
