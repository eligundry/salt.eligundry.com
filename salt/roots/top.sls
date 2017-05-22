base:
  '*':
    - shared
  'kernel:Linux':
    - match: grain
    - linux
  'kernel:Darwin':
    - match: grain
    - mac
