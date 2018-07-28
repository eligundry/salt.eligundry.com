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

npm-languageserver-pkgs:
  npm.installed:
    - pkgs:
      - neovim
      - vscode-css-languageserver-bin
      - javascript-typescript-langserver
      - dockerfile-language-server-nodejs
    - force_reinstall: true

npm-cli-tools:
  npm.installed:
    - pkgs:
      - jwt-cli
    - force_reinstall: true
