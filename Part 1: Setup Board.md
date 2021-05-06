# Windows Set-up
If you are using a **Windows** environment, you can use these instructions for your set-up.

You can click on the following links for [Linux](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Linux%20set-up.md) and [Mac](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Mac%20set-up.md) enviroments. 

# FAQ
If you are having any issues, you can refer to the [FAQ](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/FAQ.md) to help you resolve any issues.

# Part 1: Setup Board (15 - 25 minutes)
<img src="/images/Som_board_accessories.jpg" width=500 height =400>




## Items you’ll need to provide to bring up the lab
- Barrel Jack Power supply (12V,3A)
- MicroSD card [32GB UHS-1]
- Micro-USB to USB-A cable
- IAS camera module (AR1335 recommended) or USB camera
- Ethernet cable
- HDMI/DI cable (optional) to connect a monitor display

You can purchase all these items with the [KV260 Basic Accessory Pack](https://www.xilinx.com/products/som/kria/kv260-vision-starter-kit/basic-accessory-pack.html)


## Xilinx Tools needed to Boot via SD card
You will need the following tools installed on your computer or you can access the Xilinx specific tools via [AWS](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/How%20to%20connect%20to%20AWS.md) in order to boot via SD card
|Locally|Via [AWS](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/How%20to%20connect%20to%20AWS.md)|
| --- | --- |
| [Putty](https://www.putty.org/) and or [Tera Term](https://ttssh2.osdn.jp/index.html.en) Terminal <br> (click on the link to download an application terminal)| - Vivado & Vitis to update hardware or model <br> - Petalinux (2020.2 or later)|

## 1. Write to SD card
If you already have an SD card with the image pre-installed, you may skip this step. 

You can find the SD image at the following link [SD image](https://www.xilinx.com/products/som/kria/kv260-vision-starter-kit/kv260-getting-started/setting-up-the-sd-card-image.html)

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
-	Optionally, you can also connect the HDMI cable into J5 or the DisplayPort cable into J6. 4K monitor is preferred to demonstrate at the maximum supported resolution. 
-	Optionally, you can capture audio on the SOM board with an Audio Pmod setup in RTSP mode. You can connect an audio Pmod to J2, and then connect a microphone or any other [sound input device](https://store.digilentinc.com/pmod-i2s2-stereo-audio-input-and-output/). NOTE: smart camera does not support speakers. 

You can refer to the following image to pinpoint the interfaces and connectors on the SOM carrier card: 

<img src="/images/som-connections-600x600.gif" width=600 height =600>

You can also use the following cameras (from UG 1089):

|Accelerated Application |Peripheral |Part Number|
| ------------- | ------------- | ------------- |
|Smart camera AA1 | IAS camera sensor ISP interface (J7)| OnSemi AR1335 sensor module. Avnet part number: CAVBA-000A|
|Smart camera AA1 | USB camera| Logitech BRIO|
|Smart camera AA1 | Audio Codec I2S2 PMOD (J2)| Digilent PMOD SKU 410-379|
|Defect detection AA4| IAS camera sensor ISP interface (J7)| OnSemi AR0144 sensor module. Avnet part number: CAV10-000A|

You will also plug your ethernet cable into J10. You will have the best results if you are connected directly into your router. 

If you need to set up a static address within your host machine, you can follow the instructions at this link:
[Setting up a private network](https://xilinx.github.io/vck190-base-trd/build/html/run.html#setting-a-private-network) 
 
## 3. Configure your terminal
This will be used to enter and read commands for the SOM board. 
After opening Tera Term or Putty, select the COM port listed first (i.e. select COM 13 if COM 13 and COM 14 are listed). You will configure the settings in the following format: 
-	Baud rate = 115200
-	Data bits = 8
-	Stop bits = 1
-	Flow control = None
-	Parity = None

**Note** The monitor should be connected before turning on the board otherwise the resolution will not be recognized.

Power on the SOM board by connecting the power supply into J12 and into the wall outlet. Observe the LED’s illuminating to indicate power. 

<img src="/images/IMG_8591.jpg" width=400 height =500>

Plug USB cable connected into J4 into your local computer and proceed to the next part below.

## Jump to Part 2
Go to [Part 2: Exploring the Different AAs](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%202:%20Exploring%20the%20Different%20AAs.md)

Return to [Main Page](https://github.com/Xilinx/Xilinx_KV260_Workshop)

------------------------------------------------------
&copy; Copyright 2021 Xilinx, Inc. All rights reserved.
