# gf180mcu-sram-wrappers

Wrappers for GF180MCU SRAM macros to simplify Librelane integration. Identical to the original GF SRAM macros, but with additional VSS/VDD stripes on Metal4. 

To reimplement the wrapper enuse that LibreLane environment is set, go to wrappers directory and run `make librelane`. To copy implementation product into "final" dir run `make copy-final` .
