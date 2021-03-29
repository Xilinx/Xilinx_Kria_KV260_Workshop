# Enable Boot for SD card

If you notice that the SOM board isn't booting the Linux window automatically, you will need to program it with the following instructions:

## Opening QSPI Programming
1. Open a XDSB or XSCT console
2. Use the following command in the console to enable JTAG bootmode `source boot_mode/menu_tests.tcl`
3. Then you can unlock the QSPI method usingt the command `source program_qspi/spi_unlock.tcl`

## Programming QSPI 

1. Open Vivado (2020.2 and later)
2. Open HW manager under the tasks section in the opening window
3. Select the following options:
  - - Open target
  - - Open new target
  - - Next 
  - -Select Local Server
  - -Next
  - - Select xck26_0 within the Hardware devices
  - - Finish
 4. Right click on the xck26_0 target in the devices and select "Add Configuration Memory Device"
 5. Search and select "mt25qu512-qspi-x4-single"
 6. Then you will provide following files: XilinxSom_QspiImage_v1.0_202102251906.bin and zynqmsp_fsbl.elf files to program the board. (*NOTE: programming will take about 10 minutes)*
