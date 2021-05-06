# Enable Boot for SD card

If you notice that the SOM board isn't booting the Linux window automatically, you will need to program it with the following instructions:

You will need Xilinx tools to accomplish this, and to have your board connected to Vivado.

## Opening QSPI Programming
1. Open a XDSB or XSCT console
2. Use the following command in the console to enable JTAG bootmode `source boot_mode/menu_tests.tcl`
3. Then you can unlock the QSPI method usingt the command `source program_qspi/spi_unlock.tcl`

## Programming QSPI 

1. Open Vivado (2020.2 and later)
2. Open HW manager under the tasks section in the opening window
3. Select the following options:
    - Open target
    - Open new target
    - Next 
    - Select Local Server
    - Next
    - Select xck26_0 within the Hardware devices
    - Finish
 4. Right click on the xck26_0 target in the devices and select "Add Configuration Memory Device"
 5. Search and select "mt25qu512-qspi-x4-single"
 6. Then you will provide following files: XilinxSom_QspiImage_v1.0_202102251906.bin and zynqmsp_fsbl.elf files to program the board. (*NOTE: programming will take about 10 minutes)*

## Return to workshop sessions
Return to [Main Page](https://github.com/Xilinx/Xilinx_KV260_Workshop)

Go to Part 1
 - [Windows](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%201:%20Setup%20Board.md)
 - [Linux](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Linux%20set-up.md)
 - [Mac](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Mac%20set-up.md)


Go to [Part 2: Exploring the Different AAs](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%202:%20Exploring%20the%20Different%20AAs.md)

Go to [Part 3: Running through AA1](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%203:%20Running%20through%20AA1.md)

Go to [Part 4: Optional Demo](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%204:%20Optional%20Demo.md) 

------------------------------------------------------
&copy; Copyright 2021 Xilinx, Inc. All rights reserved.
