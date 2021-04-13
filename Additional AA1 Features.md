# Additional AA1 Features
The list below details the commands that can be used for AA1.

[Application options](#-application-options)

[Command Combinations](#-command-combinations)

# Application options
```
smartcam [OPTION?] - Application for face detection on SOM board of Xilinx.

 Help Options:

 -h, --help             Show help options

 --help-all             Show all help options

 --help-gst             Show GStreamer Options

 
 Application Options:

 -m, --mipi=                use MIPI camera as input source, auto detect, fail if no mipi available.

 -u, --usb=media_ID         usb camera video device id, e.g. 2 for /dev/video2

 -f, --file=file            path location of h26x file as input

 -i, --infile-type=h264     input file type: [h264 | h265]

 -W, --width=1920           resolution w of the input

 -H, --height=1080          resolution h of the input

 -r, --framerate=30         framerate of the input

 -t, --target=dp            [dp|rtsp|file]

 -o, --outmedia-type=h264   output file type: [h264 | h265]

 -p, --port=5000            Port to listen on (default: 5000)

 -a, --aitask               select AI task to be run: [facedetect|ssd|refinedet]

 -n, --nodet                no AI inference

 -A, --audio                RTSP with I2S audio input

 -R, --report               report fps

 -s, --screenfps            display fps on screen, notic this will cause perfermance degradation.

 --ROI-off                  turn off ROI (Region-of-Interest)
 ``` 

## Command Combinations
You can also use supported combinations below.
If you are using the command line, stop the process via CTRL-C prior to starting another instance. 

1. MIPI Input (IAS sensor input):

 - output: RTSP
  ```
  sudo smartcam --mipi -W 1920 -H 1080 --target rtsp
  ```
- output: RTSP with audio
 ```
sudo smartcam --mipi -W 1920 -H 1080 --target rtsp --audio
```
- output: DP
```
sudo smartcam --mipi -W 1920 -H 1080 --target dp
```
- output: file
```
sudo smartcam --mipi -W 1920 -H 1080 --target file
```
2. input file (file on file system):
   Note You must update the command to the specific file desired as the input source.

 - output: RTSP
```
sudo smartcam --file ./test.h264 -i h264 -W 1920 -H 1080 -r 30 --target rtsp
```
 - output: DP
```
sudo smartcam --file ./test.h264 -i h264 -W 1920 -H 1080 -r 30 --target dp
```
- output: file
```
sudo smartcam --file ./test.h264 -i h264 -W 1920 -H 1080 -r 30 --target file
```
3.  USB (USB webcam):
    Note You must ensure the width/height/framerate defined are supported by your USB camera.

- output: RTSP
```
sudo smartcam --usb 1 -W 1920 -H 1080 -r 30 --target rtsp
```
- output: DP
```
sudo smartcam --usb 1 -W 1920 -H 1080 -r 30 --target dp
```
- output: file
```
sudo smartcam --usb 1 -W 1920 -H 1080 -r 30 --target file
```
