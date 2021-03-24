# Part 3: Running through AA1

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

[Return to Part 2: Exploring the Different AAs](https://github.com/Xilinx/Xilinx_KV260_Workshop/edit/main/Part%202:%20Exploring%20the%20Different%20AAs.md)

[Return to Main Page](https://github.com/Xilinx/Xilinx_KV260_Workshop)
