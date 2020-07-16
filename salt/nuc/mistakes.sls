# As an emergency measure in the great Salt hack of 2020, I temporarily ran my
# Salt Master on my local machine. This is no longer needed, so I'm removing it.
salt-master-removed:
  pkg.removed:
    - pkgs:
      - salt-master
      - salt-api

