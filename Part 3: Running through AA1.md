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

There are many applications and features to utilize and explore through AA1. We will dive into each section: 

### MIPI DP display
Before continuing ensure that you are connected to a monitor via Display Port and not HDMI

Utilize the following command: `sudo 02.mipi-dp.sh`
This will play a video with the captured detection results onto the monitor.

When asked, enter the width and height as the 1st and 2nd parameter. The default value will be 1920 and 1080 respectively.

To verify

### Edit content below



Let’s look at these four scripts provided along with this application. 
21.	View the example scripts by changing the directory to the /opt/xilinx/bin directory:
cd /opt/xilinx/bin
ls -ll
You will see different shell scripts that are available. 
22.	Source the available scripts and observe the output which performs the face detection and cars, bicycles and person detection for ADAS using smart camera application running on starter kit.
•	MIPI to RTSP server – "01.mipi-rtsp.sh" – 
o	This script starts the RTSP server for MIPI captured images. The script accepts ${width} ${height} as the 1st and 2nd parameter, default value being 1920 x 1080.
o	Source the script and observe the output.
sudo ./01.mipi-rtsp.sh 
Here, you should be able to see the images the camera is capturing on the ffplay window, and when there's face captured by camera, there should be blue box drawn around the face, and the box should follow the movement of the face. 

•	MIPI to DisplayPort (using HDMI) – "02.mipi-dp.sh" – 
o	This script plays the captured video with detection results on the monitor. The script accepts ${width} ${height} as 1st and 2nd parameter, default value being 1920 x 1080.
o	Source the script and observe the output.
sudo ./02.mipi-dp.sh
Here, you should be able to see the images the camera is capturing on the monitor connected to the board, and when there's face captured by camera, there should be blue box drawn around the face, and the box should follow the movement of the face.

•	File to File – "03.file-to-file.sh" – 
o	This script reads in the sample video file named walking-people.nv12.30fps.1080p.h264 located at /usr/share/somapp/movies/AA1 directory, performs the face detection and generates the output video, and save it as ./out.h264 file. 
o	Source the script and observe the output.
sudo ./03.file-to-file.sh
Here, the input video file is "/usr/share/somapp/movies/AA1/walking-people.nv12.30fps.1080p.h264" and the generated output file is "./out.h264" that can be played using any media player, e.g. VLC, ffplay.
You should be able to see the face detection happening in the output video file as mentioned above, while there are no such boxes around the face in the input video file.

•	File to DisplayPort – "04.file-ssd-dp.sh" –
o	This script reads in the sample video file named Road-Adas.nv12.30fps.1080p.h264 located at /usr/share/somapp/movies/AA1 directory, performs the car, bicycles and person detection and displays the output video on to the monitor. 
o	Source the script and observe the output.
sudo ./04.file-ssd-dp.sh
Here you should be able to see a video of highway driving, with detection of vehicles in a bounding box.

Apart from this, with the command line, you can also mix and match your input and output combinations and run the application. For example:
23.	Run the following command which will take the input from IAS sensor (MIPI), apply the detection and output it to the file. 
smartcam_aa1 --mipi -W 1920 -H 1080 --target file >/dev/null 2>&1

Customize the AI models used in the application: 
As you have seen that there are three AI models provided here via –aitask command line option; facedetect (densebox_320_320), refinedet (refinedet_pruned_0_96), ssd (ssd_adas_pruned_0_95) etc. But the customization can be made to use other Vitis AI models of the same class or use the retrained models by the users.



### end new content




To exit out of the AA, use the following command: `xmutil unloadapp kv260-aa1`

You can use `xmutil lisapps` to see what other applications exist. 

If you need to set up a static address within your host machine, you can follow the instructions at this link:
[Setting up a private network](https://xilinx.github.io/vck190-base-trd/build/html/run.html#setting-a-private-network) 

## Conclusion
Congratulations on completing this part of the workshop. You can jump to the [summary](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Takeaways.md) page for some closing remarks about the workshop. 

If you have time, you may jump ahead to [Part 4](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%204:%20Optional%20Demo.md) or you may take it home to work on on your own.

Return to [Part 2: Exploring the Different AAs](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%202:%20Exploring%20the%20Different%20AAs.md)

Return to [Main Page](https://github.com/Xilinx/Xilinx_KV260_Workshop)
