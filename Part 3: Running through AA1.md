# Part 3: Running through AA1

In the previous section, we can load AA1 and utilize a camera sensor.

Alternatively, if you do not have MIPI or a USB camera, AA1 supports sourcing from a video file.

You can download one of the demo videos to test this feature:
 - Video 1: [Facedet / RefineDet AI Task](https://pixabay.com/videos/alley-people-walk-street-ukraine-39837/)
 - Video 2: [ADAS SSD AI Task](https://pixabay.com/videos/freeway-traffic-cars-rainy-truck-8358/)

Then, you can transcode a MP4 file to a H264 file which is one supported input format. Afterwards, upload or copy the H264 file to the board (using scp, ftp, or copy directly onto the SD card. You'll find the videos under /media/sd-mmcb1kop1/. Place the video within the directory /home/petalinux. 

## Using Jupyter Notebook 
You can use a web-browser notebook to interact with the SOM board.
To find the notebook URL, enter the following command in the Linux console: `sudo jupyter notebook list`

You will enter this URL in order to access the notebook. 

## Exploring different features of AA1

There are many applications and features to utilize and explore through AA1. You can source any of the scripts below and observe the output which performs face detection and cars, bicycles, and person detection for ADAS using smart camera application running on starter kit. 

The scripts are located in the following directory `/opt/xilinx/bin`. Use the following commands to access and see the directory:
```
cd /opt/xilinx/bin
ls -ll
```

### MIPI RTSP server
1. Type the command `sudo 01.mipi-rtsp.sh` to start rtsp server for MIPI captured images.

2. The above command will invoke commands for width and height of the display as the 1st and 2nd parameter. If you press "enter", the default parameters will be 1920 x 1080.

3. After running the script, the following message will appear:
```
stream ready at:
rtsp://boardip:port/test
```
4.  Run "ffplay rtsp://boardip:port/test" on the PC to receive the rtsp stream. To check the test, you should see images on the ffplay window, and there should be blue box drawn around the face, and the box should follow the movement of the face.

### MIPI DP display:
1. Check that your monitor (HDMI or DP) is connected
2. Type the command `sudo 02.mipi-dp.sh` to the captured video with detection results (blue bonding boxes) onto your monitor. 
3. The above command will invoke commands for width and height of the display as the 1st and 2nd parameter. If you press "enter", the default parameters will be 1920 x 1080.
4. To check the test, you should see images on the ffplay window, and there should be blue box drawn around the face, and the box should follow the movement of the face.

### File to File
1. Type the command `sudo 03.file-to-file.sh`
2. Identify the 1st argument from the script output as a path to the video file as shown below: 

3. This video output can be used for a face detection demo, generating a video with detection bounding box, etc.
4. You can play the generated ./out.h264 video file with a media player of your choosing. The output video file will show blue boxes around the faces of people that will follow any movement on the camera.

### File to DP
1. Type the command `sudo 04.file-ssd-dp.sh`
2. Identify the 1st argument from the script output as a path to the video file as shown below: 

3. This video output can be used for ADAS SSD demos or more to perform vehicle detection, peform detection bounding box, and display it to a monitor. 
4. To check, you should see a video of highway driving, with the detection of vehicles in a bounding box.

### Mix and match
1. In the command line, you can mix and match input & output combinations to run the application. 
2. For example, you can use the following command: 
```
smartcam_aa1 --mipi -W 1920 -H 1080 --target file >/dev/null 2>&1
```
This will take input from a IAS sensor (MIPI) and output the detection to a file. 

### Exit out of AA1
To exit out of AA1, use the following command: `xmutil unloadapp kv260-aa1`

You can use `xmutil lisapps` to see what other applications exist. 

If you need to set up a static address within your host machine, you can follow the instructions at this link:
[Setting up a private network](https://xilinx.github.io/vck190-base-trd/build/html/run.html#setting-a-private-network) 

## Conclusion
Congratulations on completing this part of the workshop. You can jump to the [summary](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Takeaways.md) page for some closing remarks about the workshop. 

If you have time, you may jump ahead to [Part 4](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%204:%20Optional%20Demo.md) or you may take it home to work on on your own.
<br>
<br>
Return to [Part 2: Exploring the Different AAs](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%202:%20Exploring%20the%20Different%20AAs.md)

Return to [Main Page](https://github.com/Xilinx/Xilinx_KV260_Workshop)
