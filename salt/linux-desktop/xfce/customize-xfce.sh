#!/bin/sh

[ -z "$DISPLAY" ] && echo 'Display not set, cannot configure XFCE' && exit 0

xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-filesystem -s "false"
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-home -s "false"
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-removable -s "false"
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-trash -s "false"
# xfconf-query -c xfce4-keyboard-shortcuts -n "/xfwm4/custom/<Control><Shift><Alt>Left" -s "move_window_left_key"
# xfconf-query -c xfce4-keyboard-shortcuts -n "/xfwm4/custom/<Control><Shift><Alt>Right" -s "move_window_right_key"
# xfconf-query -c xfce4-notifyd -p /theme "Numix-Manjaro"
xfconf-query -c xfwm4 -p /general/cycle_draw_frame -s "true"
xfconf-query -c xfwm4 -p /general/cycle_hidden -s "true"
xfconf-query -c xfwm4 -p /general/cycle_workspaces -s "false"
xfconf-query -c xfwm4 -p /general/mousewheel_rollup -s "false"
xfconf-query -c xfwm4 -p /general/scroll_workspaces -s "false"
xfconf-query -c xfwm4 -p /general/show_dock_shadow -s "true"
xfconf-query -c xfwm4 -p /general/show_frame_shadow -s "true"
xfconf-query -c xfwm4 -p /general/show_popup_shadow -s "true"
xfconf-query -c xfwm4 -p /general/snap_to_border -s "true"
xfconf-query -c xfwm4 -p /general/snap_to_windows -s "true"
xfconf-query -c xfwm4 -p /general/sync_to_vblank -s "true"
xfconf-query -c xfwm4 -p /general/theme -s "Numix"
xfconf-query -c xfwm4 -p /general/title_font -s "Roboto Medium 9"
xfconf-query -c xfwm4 -p /general/workspace_count -s 3
xfconf-query -c xfwm4 -p /general/workspace_names -t string -t string -t string -s "α" -s "β" -s "γ"
xfconf-query -c xfwm4 -p /general/wrap_windows -s "false"
xfconf-query -c xsettings -p /Gtk/FontName -s "Roboto Medium 10"
xfconf-query -c xsettings -p /Net/ThemeName -s "Numix"
