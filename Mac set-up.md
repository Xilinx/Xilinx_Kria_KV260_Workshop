# Mac Set-up
If you are using a **Mac**, you can use these instructions to set-up the Mac section

You can click on the following links for [Windows](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%201:%20Setup%20Board.md) and [Linux](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Linux%20set-up.md) enviroments. 


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

Using the downloaded petalinux-sdimage.wic, write the image onto an SD card that is plugged into your local computer. First, open a new terminal to check what device is assigned to the SD card. You can locate this in the *Utilities* folder within the *Applications* on the Mac.

Use the following command `diskutil list` to identify the SD card. In this example, we'll use **disk3** to indicate the SD card. Make sure that you select the correct device so that you do not accidentally overwrite the hard drive. The image below indicates the correct device based on the size and type of device: 

<img src="/images/mac_image_sd.JPG" >

If the SD card has an existing partition, you may need to unmount it with the following command: `diskutil unmount /dev/disk3s1`

Then enter the following commands in the terminal, replacing **disk3** with your SD card number:
```
sudo dd if=petalinux-sdimage.wic of=/dev/rdisk3 bs=1m
```
You can use the keyboard commands *CTRL* + *T* to see the status of the SD card write

Use `diskutil eject /dev/disk3` to eject the SD card.

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

You will need to identify the connected USB cable. Within the same Mac terminal, enter the following command to observe which COM ports appear when you plug in the USB cable attached to the KV260 into your computer

`ls /dev/tty.*`

Select the COM port listed first (i.e. select usbserial00022331 if COM usbserial00022331 and COM usbserial01122331 are listed).

You will configure the settings using the following command: `screen /dev/tty.usbserial00022331`

This corresponds to the corresponding format:
-	Baud rate = 115200
-	Data bits = 8
-	Stop bits = 1
-	Flow control = None
-	Parity = None

Power on the SOM board by connecting the power supply into J12 and into the wall outlet. Observe the LED’s illuminating to indicate power. 

<img src="/images/IMG_8591.jpg" width=400 height =500>

Plug USB cable connected into J4 into your local computer and proceed to the next part below.

## Jump to Part 2
Go to [Part 2: Exploring the Different AAs](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%202:%20Exploring%20the%20Different%20AAs.md)

Return to [Main Page](https://github.com/Xilinx/Xilinx_KV260_Workshop)

------------------------------------------------------
&copy; Copyright 2021 Xilinx, Inc. All rights reserved.
