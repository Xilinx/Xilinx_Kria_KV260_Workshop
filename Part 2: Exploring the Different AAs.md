# Part 2: Exploring the Different AAs

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

[Return to Part 1: Setup Board](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%201:%20Setup%20Board.md)

[Go to Part 3: Exploring the Different AAs]https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%203:%20Running%20through%20AA1.md)


[Return to Main Page](https://github.com/Xilinx/Xilinx_KV260_Workshop)
