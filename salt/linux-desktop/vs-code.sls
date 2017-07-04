visual-studio-code-ppa:
  pkgrepo.managed:
    - humanname: Microsoft Visual Studio Code
    - name: "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    - key_url: https://packages.microsoft.com/keys/microsoft.asc
    - file: /etc/apt/sources.list.d/vs-code.list

visual-studio-code:
  pkg.latest:
    - name: code
    - require:
      - visual-studio-code-ppa
