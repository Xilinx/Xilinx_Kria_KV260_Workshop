# Linux set-up
If you are using a **Linux** environment, you can use these instructions for your set-up.

You can click on the following links for [Windows](https://github.com/Xilinx/Xilinx_KV260_Workshop/edit/main/Part%201:%20Setup%20Board.md) and [Mac](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Mac%20set-up.md) enviroments. 


# Part 1: Setup Board
## Items you’ll need to provide to bring up the lab
- Barrel Jack Power supply (12V,3A)
- MicroSD card [32GB UHS-1]
- Micro-USB to USB-A cable
- IAS camera module (AR1335 recommended) or USB camera
- Ethernet cable
- HDMI/DI cable (optional) to connect a monitor display

## Xilinx Tools needed to Boot via SD card
You will need the following tools installed on your computer or access via [AWS]() in order to boot via SD card
- Vivado/Vitis for xsdb or xsct console
- PetaLinux (2020.2 or later)
- [Putty](https://www.putty.org/) and or [Tera Term](https://ttssh2.osdn.jp/index.html.en) Terminal (click on the link to download an application terminal)

## 1. Write to SD card
If you already have an SD card with the image pre-installed, you may skip this step. 

Using the downloaded petalinux-sdimage.wic, write the image onto an SD card that is plugged into your local computer. First, open a new terminal to check what device is assigned to the SD card.

Use the following command `dmesg|grep sd|tail` to identify the SD card. In this example, we'll use sd<#> to indicate the SD card. Make sure that you select the correct device so that you do not accidentally overwrite the hard drive. The image below indicates the correct device based on the size and type of device: 

<img src="/images/placeholder-1-e1533569576673.png" width=100 height =100>

Then enter the following commands in the terminal,replacing sd<#> with your SD card number:
```
gunzip petalinux-sdimage.wic.gz
dd if=petalinux-sdimage.wic of=/dev/sd<#>conv=fsync
sudo eject /dev/sd<#>
```

## 2. Board Set up
-	Insert the microSD card with boot image into the microSD card slot (J11)
-	Connect micro-USB cable, with the micro-B end into J4 connection. 
-	Connect the IAS camera module (AR 1335) or plug the USB camera into U44 or U46.
-	Optionally, you can also connect the HDMI cable into J5 or the DisplayPort cable into J6.  

You can refer to the following image to pinpoint the interfaces and connectors on the SOM carrier card: 

<img src="/images/placeholder-1-e1533569576673.png" width=100 height =100>
 
## 3. Configure your terminal
This will be used to enter and read commands for the SOM board. 

Within the same Linux terminal, you will need to identify the connected USB cable. Enter the following command to observe which COM ports appear when you plug in the USB cable attached to the KV260 into your computer

`dmesg | grep tty`

Four COM ports should be enumerated. The **3rd** numbered COM port corresponds to the UART.

You will configure the settings using the following command: `sudo putty /dev/ttyUSB2 -serial -sercfg 115200,8,n,1N`

This corresponds to the corresponding format:
-	Baud rate = 115200
-	Data bits = 8
-	Stop bits = 1
-	Flow control = None
-	Parity = None

Power on the SOM board by connecting the power supply into J12 and into the wall outlet. Observe the LED’s illuminating to indicate power. 

Plug USB cable connected into J4 into your local computer and proceed to the next part below:

[Go to Part 2: Running through AA1](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%202:%20Running%20through%20AA1.md)

[Return to Main Page](https://github.com/Xilinx/Xilinx_KV260_Workshop)
