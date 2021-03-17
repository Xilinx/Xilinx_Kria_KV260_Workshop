# Part 2: Running through AA1

After the boot, you will observe the green heart LED flashing along the SOM fan at LED, labeled DS35.
<img src="/images/placeholder-1-e1533569576673.png" width=100 height =100>

Open a XSDB or XSCT console and enter the following commands:
```
xsct% connect
xsct% source <path>/som_bootmode_EA0-BSP.tcl
xsct% boot_sd
```

In Tera Term, you will see a Linux window boot open, and you can log in via username is *root*, and the password is *root*.

You can then enter the following commands to execute the Smart Camera Application after you see the following window appear:

<img src="/images/placeholder-1-e1533569576673.png" width=100 height =100>

```
xmutil.py loadapp kv260-aa1
smartcam_aa1 --mipi 0 -W 1920 -H 1080 
```

If you have an HDMI or DP monitor connected to the board, you will see the following image appear on your screen.

<img src="/images/placeholder-1-e1533569576673.png" width=100 height =100>


To exit out of the AA, use the following command: `xmutil.py unloadapp kv260-aa1`

You can use `xmutil.py lisapps` to see what other applications exist. 

If you need to set up a static address within your host machine, you can follow the instructions at this link:
[Setting up a private network](https://xilinx.github.io/vck190-base-trd/build/html/run.html#setting-a-private-network) 

[Return to Part 1: Setup Board](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%201:%20Setup%20Board.md)

[Return to Main Page](https://github.com/Xilinx/Xilinx_KV260_Workshop)
