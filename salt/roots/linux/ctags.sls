{% set repo_path = '/opt/universal-ctags' %}

universal-ctags-deps:
  pkg.installed:
    - pkgs:
      - automake
      - make

univeral-ctags:
  git.latest:
    - name: https://github.com/universal-ctags/ctags.git
    - target: {{ repo_path }}
  cmd.run:
    - cwd: {{ repo_path }}
    - name: './autogen.sh && ./configure && make && make install'
    - require:
      - universal-ctags-deps
