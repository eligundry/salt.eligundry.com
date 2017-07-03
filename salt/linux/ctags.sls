{% set repo_path = '/opt/universal-ctags' %}

universal-ctags-deps:
  pkg.installed:
    - pkgs:
      - automake
      - make

univeral-ctags-repo:
  git.latest:
    - name: https://github.com/universal-ctags/ctags.git
    - target: {{ repo_path }}
    - force_clone: True

universal-ctags-build:
  cmd.run:
    - cwd: {{ repo_path }}
    - name: './autogen.sh && ./configure && make && make install'
    - watch:
      - universal-ctags-repo
    - require:
      - universal-ctags-deps
