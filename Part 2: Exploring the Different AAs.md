# Part 2: Exploring the Different AAs (30 - 45 minutes)
Before continuing, make sure that you have disabled VPN as this may prevent you from accessing files. 

# FAQ
If you are having any issues, you can refer to the [FAQ](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/FAQ.md) to help you resolve any issues.

## Initial Window
After the boot, you will observe the green heart LED flashing along the SOM fan at LED, labeled DS35.

<img src="/images/led.gif" width= 300 height =300>

In your terminal, you will see a Linux window boot open, and once it has finished booting, you can log in via username is *root*, and the password is *root*. The SOM board will be ready when you see the following window appear:

<img src="/images/som_console.JPG">

We will now explore the different AAs available on the SOM board. 

## Installing Accelerated Application packages
You can enter the command `xmutil listapps`  in the terminal to see what applications exist. 

<img src="/images/xmutil_listapps.JPG" width = 600 height = 200 >

If you don't see the packages installed, you will need to download them onto the board. Make sure the board is connected to the internet.

You can enter the command `xmutil getpkgs` to see the packages available, and then use the following commands to download the AA packages to the board.
```
# For AA1
sudo dnf install packagegroup-kv260-smartcam.noarch

# For AA2
sudo dnf install packagegroup-kv260-aibox-reid.noarch

# For AA4 
sudo dnf install packagegroup-kv260-defect-detect.noarch
```

# Converting & Loading video files to SOM
SOM has many methods of streaming video feeds: you can utilize an mipi or USB camera, or you can also source from a local video file installed on the SD card.

You can use one of your own videos, or you can download any of the demo videos provided: 
 - [Facedet / RefineDet AI Task Video](https://pixabay.com/videos/alley-people-walk-street-ukraine-39837/)
 - [ADAS SSD AI Task Video](https://pixabay.com/videos/freeway-traffic-cars-rainy-truck-8358/)
 
To use any of these videos, you need to first convert them to a h.264 format. 

| For Windows/Mac | For Linux |
| ------------- | ------------- |
| You can convert MP4 to H.264 online | You can convert MP4 to H.264 in terminal |
| 1. Go to the following link: [Convert files](https://www.convertfiles.com/convert/video/MP4-to-264.html). This is a third-party application. <br><br> 2. Click "Browse" and add the MP4 file from your computer. <br><br> 3. At *Output* format, choose *Raw H.264 Video Files (.264)* <br> <br> 4. Click *Convert* to start the conversion process. | Use the following command to do this, replacing "input-video.mp4" with the name of your video file <br> <br> ``` ffmpeg -i "input-video.mp4" -c:v libx264 -pix_fmt nv12 -r 30 output.nv12.h264``` |

After the files have been converted, you can copy them directly to your SD card. Or you can copy the H264 file to the board (using scp, ftp, or copy directly onto the SD card. Place the video within the directory `/home/petalinux`.

If you are unsure how to use scp command for Windows, Linux, or Mac, please refer to these [instructions](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/scp.md) 

## AA1: Smart Camera
This application supports camera and sensor input options with accelerated Machine Learning inference, and is able to perform **face detection** using densebox_640_360 network and detect **cars, bicycles, and people** using ssd_adas_pruned_0_95 network model. 

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
sudo smartcam --usb 1 -W 1920 -H 1080
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

To enable multi-stream on 4k monitor, you will need to run the following command to enable AA2 for a 4K display monitor.
```
sudo modetest -M xlnx -D 80000000.v_mix -s 52@40:3840x2160@NV16
```

### Streaming 1 channel
We will first explore one channel and one processor. This will display one video onto your monitor. 

Use the following command to perform this action: 
```
sudo smartcam -f ${file.h264} -W 1920 -H 1080 -r 30 -t rtsp -p 5000 -n &
```

where `${file.h264}` is the path to h264 video file

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
-s ${file.h264} -t file -p 1
```
where `${file.h264}` is the path to h264 video file

*Note* there are two sources defined by `-s`: 
 - The RTSP link, displayed in the top right corner by `-p 2`
 - A video file from the SD card, displayed in the bottom left corner by `-p 1`

You will see the following on your screen with two blue boxes representing the "unused" screens.
<img src="/images/AA2_2channels.gif">

### Streaming 4 channels
Finally, we will look at loading four channels, or videos, onto the monitor. Enter this command in the terminal:
```
sudo aibox-reid -s ${file1.h264} -t file -p 0 -s ${file2.h264} -t file -p 1 
-s ${file3.h264} -t file -p 2 -s ${file4.h264} -t file -p 3
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

------------------------------------------------------
&copy; Copyright 2021 Xilinx, Inc. All rights reserved.
