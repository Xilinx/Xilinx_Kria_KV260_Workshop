# Part 3: Running through AA1

In the previous section, we can load AA1 and utilize a camera sensor.

Alternatively, if you do not have MIPI or a USB camera, AA1 supports sourcing from a video file.

You can download one of the demo videos to test this feature:
 - Video 1: [Facedet / RefineDet AI Task](https://pixabay.com/videos/alley-people-walk-street-ukraine-39837/)
 - Video 2: [ADAS SSD AI Task](https://pixabay.com/videos/freeway-traffic-cars-rainy-truck-8358/)

Then you can enter the following command into the Linux console: `ffmpeg -i input-video.mp4 -c:v libx264 -pix_fmt nv12 -r 30 output.nv12.h264`

To exit out of the AA, use the following command: `xmutil unloadapp kv260-aa1`

You can use `xmutil lisapps` to see what other applications exist. 

If you need to set up a static address within your host machine, you can follow the instructions at this link:
[Setting up a private network](https://xilinx.github.io/vck190-base-trd/build/html/run.html#setting-a-private-network) 


Congratulations on completing this part of the workshop. If you have time, you may jump ahead to [Part 4](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%204:%20Optional%20Demo.md) or you may take it home to work on on your own.

Jump to [summary](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Takeaways.md) slide

Return to [Part 2: Exploring the Different AAs](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%202:%20Exploring%20the%20Different%20AAs.md)

Return to [Main Page](https://github.com/Xilinx/Xilinx_KV260_Workshop)
