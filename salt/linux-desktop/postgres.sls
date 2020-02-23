postgresql-client:
  pkg.installed

pgadmin3:
  pkg.installed

postgresql-stopped:
  service.dead:
    - name: postgresql

postgresql-disabled:
  service.disabled:
    - name: postgresql
