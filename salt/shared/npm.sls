{% set user = pillar['user']['name'] %}

create-react-app:
  npm.installed:
    - user: {{ user }}

create-react-native-app:
  npm.installed:
    - user: {{ user }}
    - pkgs:
      - create-react-native-app
      - react-native-cli
      - watchman

gulp:
  npm.installed:
    - user: {{ user }}
