{% set user = pillar['user']['name'] %}

create-react-app:
  npm.installed

create-react-native-app:
  npm.installed:
    - pkgs:
      - create-react-native-app
      - react-native-cli
      - watchman

gulp:
  npm.installed

parcel-bundler:
  npm.installed

vscode-css-languageserver-bin:
  npm.installed

javascript-typescript-langserver:
  npm.installed
