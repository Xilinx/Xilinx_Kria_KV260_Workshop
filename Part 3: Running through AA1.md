# Part 3: Running through AA1

In the previous section, we loaded different AAs and explored what they could do. Now, we will dive into AA1. We briefly utilized the camera sensor. Alternatively, AA1 can support sourcing from a video file.

You can use one of your own videos, or you can download any of the demo videos provided: 
 - [Facedet / RefineDet AI Task Video](https://pixabay.com/videos/alley-people-walk-street-ukraine-39837/)
 - [ADAS SSD AI Task Video](https://pixabay.com/videos/freeway-traffic-cars-rainy-truck-8358/)
 
To use any of these videos, you need to first convert them to a h.264 format. 

| For Windows/Mac | For Linux |
| ------------- | ------------- |
| You can convert MP4 to H.264 online | You can convert MP4 to H.264 in terminal |
| 1. Go to the following link: [Convert files](https://www.convertfiles.com/convert/video/MP4-to-264.html). This is a third-party application. <br><br> 2. Click "Browse" and add the MP4 file from your computer. <br><br> 3. At *Output* format, choose *Raw H.264 Video Files (.264)* <br> <br> 4. Click *Convert* to start the conversion process. | Use the following command to do this, replacing "input-video.mp4" with the name of your video file <br> <br> ``` ffmpeg -i "input-video.mp4" -c:v libx264 -pix_fmt nv12 -r 30 output.nv12.h264``` |

After the files have been converted, you can copy them directly to your SD card. Or you can copy the H264 file to the board (using scp, ftp, or copy directly onto the SD card. You'll find the videos under /media/sd-mmcb1kop1/. Place the video within the directory /home/petalinux. 

If you are unsure how to use scp command for Windows, Linux, or Mac, please refer to these [instructions](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/scp.md) 

## Using Jupyter Notebook 
You can use a web-browser notebook to interact with the SOM board.
To find the notebook URL, enter the following command in the Linux console: `sudo jupyter notebook list`

You will enter the outputed URL into your browser.

You can run through the notebooks on your own time to further explore their applications.

## Baseline measurements
There are a number of tests you can perform with the smart camera:

1. Throughput Measurement (Frames per Second)

Enter the following command to display the FPS in the terminal. In this case, it should be around 49 FPS. 
```
sudo smartcam --file /media/sd-mmcblk0p1/walking-people.nv12.30fps.1080p.h264 -i h264 -W 1920 -H 1080 -r 30 --target dp --aitask facedetect -R
```
You will see an image like the one below:

<img src="/images/SOM_FPS.JPG">

2. Power Measurement

Enter the following command to view how much power is being consumed via the smart camera. This command is run in the background. 
```
sudo smartcam --file /media/sd-mmcblk0p1/walking-people.nv12.30fps.1080p.h264 -i h264 -W 1920 -H 1080 -r 30 --target dp --aitask facedetect &
```
You will see an output like the one below 

<img src="/images/Power Measurement.JPG">


3. End-to-end Latency Measurement
This is a useful tool to measure interlancey value in AA1 via the GStreamer pipeline embedded in the smart camera. This measurement is calculated from the source plugin to the sink plugin.

Run the following commands to install the GstShark packages:

```
dnf search GstShark
sudo dnf install libgstshark0.aarch64
```

To measure latency while using the facdetect model use the following command, which will capture the FPS and interlanecy values. These values will be saved in a log file called "facedetect-log.txt" file. 
```
sudo GST_DEBUG="GST_TRACER:7" GST_TRACERS=interlatency smartcam --file /media/sd-mmcblk0p1/walking-people.nv12.30fps.1080p.h264 -i h264 -W 1920 -H 1080 -r 30 --target dp --aitask facedetect >& facedetect-log.txt &
```

To access these values, run the below command in the terminal:
```
grep -rn interlatency facedetect-log.txt | tail -n 20 | cut -d'=' -f2-4
```

## Exploring different features of AA1

There are many applications and features to utilize and explore through AA1. You can source any of the .sh scripts below and observe the output. These scripts performs face detection and cars, bicycles, and person detection for ADAS using smart camera application.

You can either type out the commands yourself or you can utilize one of the pre-written scripts. Please try both methods so you can see what is happening in the scripts.

The scripts are located in the following directory `/opt/xilinx/bin`. Use the following commands to access and see the directory:
```
cd /opt/xilinx/bin
ls -ll
```

### MIPI RTSP server
This command will stream the live video feed from the camera to an rtsp server, on which other users can see the footage if they have access to the rtsp link.

1. Type the command `sudo 01.mipi-rtsp.sh` to start rtsp server for MIPI captured images. Alternatively, you can enter the following command: 
```
smartcam --mipi -t rtsp
```
This will utilize the AR1335 camera or "mipi" device and stream via RTSP. You can specify the width and height of the monitor via `-w` and `-h` commands. Otherwise, it will default to 1920 x 1080.

2. After running the script, the following message will appear:
<img src="/images/rtsp stream.JPG">

You can stream this rtsp in different ways depending on your OS

| For Windows/Mac | For Linux |
| ------------- | ------------- |
| Enter the network address provided by the AA1 output into any of video media platform: <br> - QuickTime <br> -Winamp <br> - VLC <br> - Windows Media Player (Windows only) | - Run "ffplay rtsp://boardip:port/test" on a Linux system to view the rtsp stream. <br> - If you don't have "ffplay" on your computer, you will need to install it with `sudo apt install ffmpeg`|

To check the test, you should see images on the ffplay window, and there should be blue box drawn around the face, and the box should follow the movement of the face. 

Example rtsp link could be the following:
```
ffplay rtsp://192.168.1.26:554/test
```

The example below shows the command and the video playing: 
**image** 

### MIPI DP display
This command will directly stream your live footage from the camera to an HDMI or DP monitor. This is useful if you have a larger monitor to show to a group of people. 

1. Check that your monitor (HDMI or DP) is connected
2. Type the command `sudo 02.mipi-dp.sh` to the captured video with detection results (blue bonding boxes) onto your monitor. Or you can enter the command `smartcam --mipi --target dp`
3. To check the test, you should see images on the ffplay window, and there should be blue box drawn around the face, and the box should follow the movement of the face.

### File to File
This command will take a pre-existing video file and stream it onto your monitor.
1. Type the command `sudo 03.file-to-file.sh`. Or you can enter the command: `smartcam --file ${file} --infile-type h264 --target file`. 

2. Identify the 1st argument **${file}** from the script output as a path to the video file.

3. This video output can be used for a face detection demo, generating a video with detection bounding box, etc.
4. You can play the generated ./out.h264 video file with a media player of your choosing. The output video file will show blue boxes around the faces of people that will follow any movement on the camera.

<img src="/images/AA1_file_to_file.gif">


### File to DP
This will take a pre-existing video file and display it to the monitor. In this example, we will add the ```--aitask``` command to perform an AI task to run. 

AA1 comes with three different options for AI tasks:
1. facedetect
2. ssd 
3. refinedet

We will specifically run ssd, which will display detection bounding boxes in red with green labels.

1. Type the command `sudo 04.file-ssd-dp.sh` Or you can enter the command `smartcam --file ${file} --target dp -r 30 --aitask ssd`
2. Identify the 1st argument **${file}** from the script output as a path to the video file.

3. This video output can be used for ADAS SSD demos or more to perform vehicle detection, peform detection bounding box, and display it to a monitor. 
4. To check, you should see a video of highway driving, with the detection of vehicles in a bounding box.

<img src="/images/AA1_file_to_DP.gif">


### Mix and match
1. In the command line, you can mix and match input & output combinations to run the application. 
2. For example, you can use the following command: 
```
smartcam --mipi -W 1920 -H 1080 --target file >/dev/null 2>&1
```
This will take input from a IAS sensor (MIPI) and output the detection to a file. 

You can refer to the following table to explore more features within AA1: 
[AA1 features & commands](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Additional%20AA1%20Features.md)

## Exit out of AA1
To exit out of AA1, use the following command: `xmutil unloadapp kv260-aa1`

You can use `xmutil listapps` to see what other applications exist. 

## Jump to Part 4 (Optional)
If you have time, you may jump ahead to [Part 4](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%204:%20Optional%20Demo.md) or you may take it home to work on on your own.

## End of Part 3
Congratulations on completing this part of the workshop. You can jump to the [summary](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Takeaways.md) page for some closing remarks about the workshop. 

## Return to Previous sections
Return to [Part 2: Exploring the Different AAs](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%202:%20Exploring%20the%20Different%20AAs.md)

Return to [Main Page](https://github.com/Xilinx/Xilinx_KV260_Workshop)
