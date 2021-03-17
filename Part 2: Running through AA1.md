# Part 2: Running through AA1


After the boot, you will observe the green heart LED flashing along the SOM fan at LED, 

In Tera Term, you will see a Linux window boot open, and you can log in via username is *root*, and the password is *root*.

The Linux prompt will open and you can enter the following commands to execute the Smart Camera Application:

```
Xmutil.py loadapp AA1
```

If you have an HDMI or DP monitor connected to the board, you will see the following image appear on your screen.


You can use `xmutil.py lisapps` to see what other applications exist. 

If you need to set up a static address within your host machine, you can follow the instructions at this link:
[Setting up a private network](https://xilinx.github.io/vck190-base-trd/build/html/run.html#setting-a-private-network) 

[Return to Part 1: Setup Board](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%201:%20Setup%20Board.md)

[Return to Main Page](https://github.com/Xilinx/Xilinx_KV260_Workshop)
