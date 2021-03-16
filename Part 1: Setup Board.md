## Item’s you’ll need to provide to bring up the lab
- Barrel Jack Power supply (12V,3A)
- MicroSD card [32GB UHS-1]
- Micro-USB to USB-A cable
- IAS camera module (AR1335 recommended) or USB camera
- Ethernet cable
- HDMI/DI cable (optional) to connect a monitor display

You can refer to the following image to pinpoint the interfaces and connectors on the SOM carrier card: 
 
## Xilinx Tools needed to Boot via SD card
You will need the following tools in order to boot via SD card
- Download Vivado/Vitis
- Download PetaLinux (2020.2 or later)

## Write to SD card
Using the downloaded image, petalinux-sdimage.wic, write the image into an sdcard that is plugged into the computer. You can use one of the following tools to write the disk image, and instructions are outlined in the following resources:
- Balena Etcher
[Download] (https://www.balena.io/etcher/ )
- Win32 Disk Image
[Download] (https://sourceforge.net/projects/win32diskimager/ )
[Instructions for Balena Win32] (https://www.raspberrypi.org/documentation/installation/installing-images/windows.md )
- Linux dd tool 
In addition, you will need to download the FTDI virtual COM port driver as it connects to the COM port device. You can install it at the following [link] (https://www.ftdichip.com/Drivers/VCP.htm)

## Board Set up
-	Insert the microSD card with boot image into the microSD card slot (J11)
-	Connect micro-USB cable, with the micro-B end into J4 connection. 
-	Connect the IAS camera module (AR 1335) or plug the USB camera to U44 or U46.
-	Optionally, you can also connect the HDMI cable to J5 or the DisplayPort cable to J6.  
 
For a linux environment, you can write to the SD card directly through the terminal: 
`$ dmesg | grep sd|tail`
The above command will identify what device to write it to.
Then you can use the following commands to write image to the SD card:
```
$gunzip petalinux-sdimage.wic.gz
dd if=petalinux-sdimage.wic of=/dev/sd<?>conv-fsync
sudo eject /dev/sd<?>
```


## Configure your terminal
This will be used to enter and read commands for the SOM board. 
After opening Tera Term or Putty you will configure the settings in the following format: 
-	Baud rate = 115200
-	Data bits = 8
-	Stop bits = 1
-	Flow control = None
-	Parity = None

Power on the SOM board by connecting the power supply and observer the LED’s illuminating. 
