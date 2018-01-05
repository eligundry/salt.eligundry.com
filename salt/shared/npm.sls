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

parcel-bundler:
  npm.installed:
    - user: {{ user }}

vscode-css-languageserver-bin:
  npm.installed:
    - user: {{ user }}

javascript-typescript-langserver:
  npm.installed:
    - user: {{ user }}
