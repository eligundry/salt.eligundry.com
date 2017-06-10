{% set openvpn_server = salt['pillar.get']('openvpn:server') %}
declare -x OVPN_AUTH=""
declare -x OVPN_CIPHER=""
declare -x OVPN_CLIENT_TO_CLIENT
declare -x OVPN_CN="{{ openvpn_server }}"
declare -x OVPN_COMP_LZO
declare -x OVPN_DEFROUTE="1"
declare -x OVPN_DEVICE="tun"
declare -x OVPN_DNS="1"
declare -x OVPN_ENV="/etc/openvpn/ovpn_env.sh"
declare -x OVPN_FRAGMENT
declare -x OVPN_MTU
declare -x OVPN_NAT="0"
declare -x OVPN_OTP_AUTH
declare -x OVPN_PORT="1194"
declare -x OVPN_PROTO="udp"
declare -x OVPN_PUSH
declare -x OVPN_ROUTES
declare -x OVPN_SERVER="192.168.255.0/24"
declare -x OVPN_SERVER_URL="udp://{{ openvpn_server }}"
declare -x OVPN_TLS_CIPHER=""
