{% set user = pillar['user']['name'] %}

create-react-app:
  npm.installed:
    - force_reinstall: true

create-react-native-app:
  npm.installed:
    - pkgs:
      - create-react-native-app
      - react-native-cli
      - watchman
    - force_reinstall: true

gulp:
  npm.installed:
    - force_reinstall: true

parcel-bundler:
  npm.installed:
    - force_reinstall: true

vscode-css-languageserver-bin:
  npm.installed:
    - force_reinstall: true

javascript-typescript-langserver:
  npm.installed:
    - force_reinstall: true

dockerfile-language-server-nodejs:
  npm.installed:
    - force_reinstall: true

jwt-cli:
  npm.installed:
    - force_reinstall: true
