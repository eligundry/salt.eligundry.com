digitalocean-agent-ppa:
  pkgrepo.managed:
    - humanname: DigitalOcean Agent
    - name: deb https://repos.insights.digitalocean.com/apt/do-agent/ main main
    - dist: main
    - file: /etc/apt/sources.list.d/digitalocean-agent.list
    - key_url: https://repos.insights.digitalocean.com/sonar-agent.asc

digitalocean-agent:
  pkg.latest:
    - name: do-agent
    - refresh: True
    - require:
      - digitalocean-agent-ppa
