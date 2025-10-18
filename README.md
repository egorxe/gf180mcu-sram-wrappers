# gf180mcu-sram-wrappers

Wrappers for GF180MCU SRAM macros to simplify Librelane integration. SRAM blocks themselves are identical to the original GF SRAM macros, but wrappers add VSS/VDD stripes on Metal4 to connect to top-level PDN. 

To reimplement one of the wrappers ensure that LibreLane environment is set, go to wrappers directory and run `make librelane` . To copy implementation product into "final" dir run `make copy-final` .
