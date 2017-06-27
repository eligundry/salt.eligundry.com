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

add-i386-architecture:
  cmd.run:
    - name: dpkg --add-architecture i386
    - unless: dpkg --print-foreign-architectures | grep i386
    - comment: Enable 32 bit packages for ZSNES.

snes:
  pkg.latest:
    - name: 'zsnes:i386'

nintendo-64:
  pkg.latest:
    - name: mupen64plus
