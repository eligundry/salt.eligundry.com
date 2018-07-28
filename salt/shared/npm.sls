npm-build-tools:
  npm.installed:
    - pkgs:
      - create-react-app
      - create-react-native-app
      - gulp
      - parcel
      - react-native-cli
      - watchman
    - force_reinstall: true

npm-cli-tools:
  npm.installed:
    - pkgs:
      - jwt-cli
    - force_reinstall: true
