nes:
  pkg.latest:
    - name: fceux

gameboy-advance:
  pkg.latest:
    - pkgs:
      - visualboyadvance
      - visualboyadvance-gtk

playstation-one:
  pkg.latest:
    - name: pcsxr

snes:
  pkg.latest:
    - name: 'zsnes:i386'
    - require:
      - add-i386-architecture

nintendo-64:
  pkg.latest:
    - name: mupen64plus
