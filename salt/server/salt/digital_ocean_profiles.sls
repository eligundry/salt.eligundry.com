small-droplet:
  provider: digital_ocean
  size: s-1vcpu-2gb
  location: nyc3
  ipv6: true
  image: {{ image }}

medium-droplet:
  provider: digital_ocean
  size: s-2vcpu-2gb
  location: nyc3
  ipv6: true
  image: {{ image }}

big-droplet:
  provider: digital_ocean
  size: s-2vcpu-4gb
  location: nyc3
  ipv6: true
  image: {{ image }}

big-boy-droplet:
  provider: digital_ocean
  size: s-8vcpu-32gb
  location: nyc3
  ipv6: true
  image: {{ image }}
