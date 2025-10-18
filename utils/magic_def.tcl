lef read ../gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_ip_sram/lef/$::env(CELL).lef

load $::env(CELL)

def write template.def
exit
