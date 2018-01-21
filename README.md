# salt.eligundry.com

This is a collection of [SaltStack][1] states that allow me to replicate my development environments across my machines
consistently.

I gave a talk about the reasoning behind this at [NYC Vim][2].

## Installation

1. Install the Salt Minion
2. Set the master to `eligundry.ninja`
3. Authenticate the keys
4. `./init.sh <device-name>`

## OpenVPN

Here's how to add a client to the OpenVPN server, which is powered by Docker [`kylemanna/docker-openvpn`][3].

```sh
$ export OVPN_DATA='/opt/openvpn'
$ docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full CLIENTNAME nopass
$ docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient CLIENTNAME > CLIENTNAME.ovpn
```

[1]: https://saltstack.com/
[2]: https://eligundry.com/talks/dots/
[3]: https://github.com/kylemanna/docker-openvpn
