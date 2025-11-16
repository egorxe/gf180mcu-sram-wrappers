#!/bin/sh
#
# Copy liberty & verilog files of original SRAM macro changing cell name to wrapper name
#

NEW_LIB_DIR=final/lib
NEW_V_DIR=final/verilog
NEW_CELL_NAME=$(basename $PWD)
RAM=$(echo $NEW_CELL_NAME | sed -rn 's/^.*gf180_ram_(.*)_wrapper/\1/'p)
ORIG_CELL_NAME=gf180mcu_fd_ip_sram__sram${RAM}m8wm1

LIBS=$(ls $PDK_ROOT/$PDK/libs.ref/gf180mcu_fd_ip_sram/lib/$ORIG_CELL_NAME*.lib)
VERILOG=$(ls $PDK_ROOT/$PDK/libs.ref/gf180mcu_fd_ip_sram/verilog/$ORIG_CELL_NAME.v)

mkdir -p $NEW_LIB_DIR $NEW_V_DIR

for l in $LIBS; do
    echo "Copying liberty file $l"
    new_lib="$NEW_LIB_DIR/$NEW_CELL_NAME$(basename "$l" | sed -rn 's/^gf180mcu_fd_ip_sram__sram.*(__.*lib)/\1/p')"
    cat $l | sed "s/$ORIG_CELL_NAME/$NEW_CELL_NAME/" > $new_lib
done

for l in $VERILOG; do
    echo "Copying Verilog file $l"
    new_v="$NEW_V_DIR/${NEW_CELL_NAME}.v"
    cat $l | sed "s/$ORIG_CELL_NAME/$NEW_CELL_NAME/" > $new_v
done
