# Part 2: Exploring the Different AAs

After the boot, you will observe the green heart LED flashing along the SOM fan at LED, labeled DS35.

<img src="/images/placeholder-1-e1533569576673.png" width=100 height =100>


In Tera Term, you will see a Linux window boot open, and you can log in via username is *root*, and the password is *root*.

You can then enter the following commands to execute the Smart Camera Application after you see the following window appear:

<img src="/images/som_console.JPG" width=500 height=150>

After the Linux window has booted, we will now explore the different AAs available on the SOM board. You can use `xmutil lisapps` to see what applications exist. 

## AA1: Smart camera
After the Linux window booted, we will connect to the AA1 via the following commands. 
```
xmutil loadapp kv260-aa1
smartcam_aa1 --mipi 0 -W 1920 -H 1080 
```

If you have an HDMI or DP monitor connected to the board, you will see the following image appear on your screen.

<img src="/images/som_aa1.png" width=400 height =200>

To exit out of the AA1, use the following command: `xmutil unloadapp kv260-aa1`

## AA2: AI box
This applicaiton supports multi-stream IP camera RTSP inputs for supporting **pedestrian detection and re-identification (ReID)**. The network model is refinedet_pruned_0_96. The models in AI box can be dynamically loaded with the inference information displayed to a 4K monitor. The application can support up to 4 multiple streams or channels of 1080p videos running simultaneously. 

To load the AI box, run the following command
```
xmutil loadapp kv260-aa2
```
Then you will need to run the following command to enable AA2 for a 4K display monitor.
`sudo modetest -M xlnx -D 80000000.v_mix -s 52@40:3840x2160@NV16`

There are multiple ways you can set up AI box application, depending on the number of channels you want to enable. For this workshop, we will explore one channel and one process. 

You will need to setup a RTSP server link to be an input for the application. If you don not have a RTSP server on hand, smartcam_aa1 application can be used as the RTSP server on the AA2 platform, with -n option, which turn off the server side AI inference.

Use the following command to perform this action: `smartcam_aa1 -f /usr/share/somapp/movies/AA2/AA2-park.nv12.30fps.1080p.h264 -W 1920 -H 1080 -r 30 -t rtsp -p 5000 -n &`

The following command will run the AI box application with one channel and one process. 
`sudo aibox_aa2 -s rtsp://192.168.29.11:5000/test -t rtsp -p 0`


To exit out of the AA2, use the following command: `xmutil unloadapp kv260-aa2`

## AA4: Defect detection
```
xmutil loadapp kv260-aa4
```
To exit out of the AA4, use the following command: `xmutil unloadapp kv260-aa4`

## AA5: License plate recognition
```
xmutil loadapp kv260-aa5
```
To exit out of the AA5, use the following command: `xmutil unloadapp kv260-aa5`

Return to [Part 1: Setup Board](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%201:%20Setup%20Board.md)

Go to [Part 3: Running through AA1](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%203:%20Running%20through%20AA1.md)

Return to [Main Page](https://github.com/Xilinx/Xilinx_KV260_Workshop)
