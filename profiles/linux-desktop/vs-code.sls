visual-studio-code-ppa:
  pkgrepo.managed:
    - humanname: Microsoft Visual Studio Code
    - name: "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    - key_url: https://packages.microsoft.com/keys/microsoft.asc
    - file: /etc/apt/sources.list.d/vscode.list

visual-studio-code:
  pkg.installed:
    - name: code
    - require:
      - visual-studio-code-ppa
