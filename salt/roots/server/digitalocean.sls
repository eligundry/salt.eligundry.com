digitalocean-agent-ppa:
  pkgrepo.managed:
    - humanname: DigitalOcean Agent
    - name: deb https://repos.sonar.digitalocean.com/apt main main
    - dist: main
    - file: /etc/apt/sources.list.d/digitalocean-agent.list
    - key_url: https://repos.sonar.digitalocean.com/sonar-agent.asc
    - require:
      - apt-extensions

digitalocean-agent:
  pkg.latest:
    - name: do-agent
    - refresh: True
    - require:
      - digitalocean-agent-ppa
