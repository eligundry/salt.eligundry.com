{{ name }}:
  driver: {{ driver }}
  personal_access_token: {{ token }}
  private_key: {{ private_key }}
  keyname: The Usual
  securitygroup: default
  minion:
    master: {{ salt_master }}
