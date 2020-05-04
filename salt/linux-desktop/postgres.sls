postgresql-client:
  pkg.installed

postgresql-stopped:
  service.dead:
    - name: postgresql

postgresql-disabled:
  service.disabled:
    - name: postgresql
