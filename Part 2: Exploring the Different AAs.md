# Part 2: Exploring the Different AAs (30 - 45 minutes)
Before continuing, make sure that you have disabled VPN as this may prevent you from accessing files. 

# FAQ
If you are having any issues, you can refer to the [FAQ](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/FAQ.md) to help you resolve any issues.

## Initial Window
After the boot, you will observe the green heart LED flashing along the SOM fan at LED, labeled DS35.

<img src="/images/led.gif" width= 300 height =300>

In Tera Term, you will see a Linux window boot open, and you can log in via username is *root*, and the password is *root*.

You can then enter the following commands to execute the Smart Camera Application after you see the following window appear:

<img src="/images/som_console.JPG">

After the Linux window has booted, we will now explore the different AAs available on the SOM board. 

## Installing Accelerated Application packages
You can use `xmutil listapps` to see what applications exist. 

<img src="/images/xmutil_listapps.JPG" width = 600 height = 200 >

If you don't see the packages installed, you will need to download them onto the board. Make sure the board is connected to the internet.

You can enter the command `xmutil getpkgs` to see the packages available, and then use the following commands to download the AA packages to the board.
```
# For AA1
sudo dnf install packagegroup-kv260-smartcam-aa1.noarch

# For AA2
sudo dnf install packagegroup-kv260-aibox-aa2.noarch

# For AA4 
sudo dnf install packagegroup-kv260-defect-detection-aa4.noarch
```
## AA1: Smart Camera
This application supports camera and sensor input options with accelerated Machine Learning inference, and is able to perform **face detection** using densebox_640_360 network and **cars, bicycles, and people** using ssd_adas_pruned_0_95 network model. 

### Loading application
You can connect to the AA1 via the following commands:
```
sudo xmutil unloadapp
sudo xmutil loadapp kv260-smartcam
```
Please wait a few moments before running the next command. Wait to see `Loaded kv260-smartcam successfully` Otherwise, the camera devices will not be available. 

You can use the following command to use the camera module:
```
sudo smartcam --mipi 0 -W 1920 -H 1080
```

Otherwise you can use a USB camera with this command:
```
sudo smartcam --usb 0 -W 1920 -H 1080
```

If you have an HDMI or DP monitor connected to the board, you will see a similar image appear on your screen. The footage will show faces wrapped in a blue bounding box.

<img src="/images/som_aa1.png" width=400 height =200>

We will dive into more features of AA1 in the next section.

## AA2: AI box
This application supports multi-stream IP camera RTSP inputs for **pedestrian detection and re-identification (ReID)**. The network model is refinedet_pruned_0_96. The models in AI box can be dynamically loaded with the inference information displayed to a 4K monitor. The application can support up to 4 multiple streams or channels of 1080p videos running simultaneously. 

You will need to setup a RTSP server link to be an input for the application. If you do not have a RTSP server on hand, smartcam application can be used as the RTSP server on the AA2 platform, with -n option, which turn off the server side AI inference.

### Loading application
To load the AI box, run the following command
```
sudo xmutil unloadapp
sudo xmutil loadapp kv260-aibox-reid
```
If you cannot see videos on the 4k monitor, you will need to run the following command to enable AA2 for a 4K display monitor.
```
sudo modetest -M xlnx -D 80000000.v_mix -s 52@40:1920x1080@NV16 
```
*Note* the 1920x1080 will depend on your monitor.

### Streaming 1 channel
We will first explore one channel and one processor. This will display one video onto your monitor. 

Use the following command to perform this action: 
```
sudo smartcam -f /usr/share/somapp/movies/AA2/AA2-park.nv12.30fps.1080p.h264 -W 1920 -H 1080 -r 30 -t rtsp -p 5000 -n &
```

Running this command will output the following: 
```
stream ready at: rtsp://192.168.1.26:5000/test
```

This will be the link to observe the output on the 4K monitor with the following command:
```
sudo aibox-reid -s rtsp://192.168.1.26:5000/test -t rtsp -p 0
```

You should see an output on your monitor like the one below:

<img src="/images/AA2_1channel.gif">

### Streaming 2 channels
Next, we will explore two channels, or videos, playing on the monitor. Enter this command in the terminal: 
```
sudo aibox-reid -s rtsp://192.168.29.11:5000/test -t rtsp -p 2 
-s /media/sd-mmcblk0p1/AA2-shop.nv12.30fps.1080p.h264 -t file -p 1
```
*Note* there are two sources defined by `-s`: 
 - The RTSP link, displayed in the top right corner by `-p 2`
 - A video file from the SD card, displayed in the bottom left corner by `-p 1`

You will see the following on your screen with two blue boxes representing the "unused" screens.
<img src="/images/AA2_2channels.gif">

### Streaming 4 channels
Finally, we will look at loading four channels, or videos, onto the monitor. Enter this command in the terminal:
```
sudo aibox-reid -s /media/sd-mmcblk0p1/AA2-shop.nv12.30fps.1080p.h264 -t file -p 0 -s /media/sd-mmcblk0p1/AA2-liverpool-1.nv12.30fps.1080p.h264 -t file -p 1 -s /media/sd-mmcblk0p1/AA2-park.nv12.30fps.1080p.h264 -t file -p 2 -s /media/sd-mmcblk0p1/AA2-liverpool-2.nv12.30fps.1080p.h264 -t file -p 3
```
*Note* the four files indicated in the four quardants by `-p 0`, `-p 1`,`-p 1`,`-p 2`, and `-p 3`. They are sourced from four different input files on the SD card.

You will see four different videos playing simulatenously.
<img src="/images/AA2_4channels.gif">


## AA4: Defect detection (Coming Soon)
```
sudo xmutil unloadapp
xmutil loadapp kv260-aa4
```

There are multiple options for live playback. You can test any of the following methods below. To stop the defect-detect application, use CTRL-C in the command line.
 - For Normal mode: 
   ```
   defect-detect -w 1280 -h 800 -r 60 -f 0 -d 0 -m /dev/media0
   ```
 - For Demo mode: 
   ```
   defect-detect -w 1280 -h 800 -r 60 -f 0 -d 1 -m /dev/media0
   ```
 - For File playback: 
 ```
 defect-detect -w 1280 -h 800 -r 60 -f 1 -i input.yuv -x raw.yuv -y pre_pros.yuv -z final.yuv
 ```
 
## Jump to Part 3

Go to [Part 3: Running through AA1](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%203:%20Running%20through%20AA1.md)

Return to [Part 1: Setup Board](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%201:%20Setup%20Board.md)

Return to [Main Page](https://github.com/Xilinx/Xilinx_KV260_Workshop)
