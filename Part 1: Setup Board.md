# Windows set-up
If you are using a Windows environment, you can use these instructions for your set-up.

You can click on the following links for [Linux](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Linux%20set-up.md) and [Mac](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Mac%20set-up.md) enviroments. 

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

Using the downloaded petalinux-sdimage.wic, write the image onto an SD card that is plugged into your local computer. You can use one of the following tools to write the disk image. The instructions for writing to the SD card are included as well:
| Balena Etcher | Win32 Disk |
| --- | --- |
| [Download](https://www.balena.io/etcher/ ) | [Download](https://sourceforge.net/projects/win32diskimager/ ) |
| [Instructions for Balena Etcher](https://www.raspberrypi.org/documentation/installation/installing-images/windows.md) | [Instructions for Win32](https://www.raspberrypi.org/documentation/installation/installing-images/windows.md ) |

In addition, you will need to download the FTDI virtual COM port driver as it connects to the COM port device. You can install it at the following [link](https://www.ftdichip.com/Drivers/VCP.htm)

## 2. Board Set up
-	Insert the microSD card with boot image into the microSD card slot (J11)
-	Connect micro-USB cable, with the micro-B end into J4 connection. 
-	Connect the IAS camera module (AR 1335) or plug the USB camera into U44 or U46.
-	Optionally, you can also connect the HDMI cable into J5 or the DisplayPort cable into J6.  

You can refer to the following image to pinpoint the interfaces and connectors on the SOM carrier card: 

<img src="/images/placeholder-1-e1533569576673.png" width=100 height =100>
 
## 3. Configure your terminal
This will be used to enter and read commands for the SOM board. 
After opening Tera Term or Putty, select the COM port listed first (i.e. select COM 13 if COM 13 and COM 14 are listed). You will configure the settings in the following format: 
-	Baud rate = 115200
-	Data bits = 8
-	Stop bits = 1
-	Flow control = None
-	Parity = None

Power on the SOM board by connecting the power supply into J12 and into the wall outlet. Observe the LED’s illuminating to indicate power. 

Plug USB cable connected into J4 into your local computer and proceed to the next part below:

[Go to Part 2: Running through AA1](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%202:%20Running%20through%20AA1.md)

[Return to Main Page](https://github.com/Xilinx/Xilinx_KV260_Workshop)
