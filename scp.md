# How to SCP

## Windows
You want to download [WinSCP](https://winscp.net/eng/download.php) for Windows file transfer

1. Open WinSCP
2. When you open WinSCP, you can select SCP for File protocol. 
3. You will enter in the host name, username, and password as provided by your workshop coordinator. Port 22 is the default port number.

NOTE: the hostname will usually be the IP address of the computer or the SOM board. You can use ipconfig (for Windows) or ifconfig(for Linux/Mac/SOM board) to determine the IP address.

<img src="/images/winscp_image1.JPG">

4. You can transfer the files by selecting the desired file and dragging it over to the desired window. This will transfer the file via SCP.

Note the hello.txt file in both windows:
<img src="/images/winscp_image3.JPG">


## Linux & Mac
For Linux & Mac, you will SCP or copy files to your computer.


Enter the following command into a terminal: 
```
scp [source_username]@[source_IP_address]:[path to file] [destination_username]@[destination_IP_address]:[path to destination]
```
You will need to enter the password to access the files.

The user name for the destination is the login in for the SOM board, and the board IP_address is the found by entering `ifconfig` into the board terminal.

**NOTE** if you are using the AWS instance to scp files over to your local computer, use the **Public** IP address as provided by the workshop admin. This should be the same IP address you used to log in. Using `ifconfig` in the AWS terminal will only share the Private IP address, which is internal to AWS and inaccessible.  

## Return to workshop sessions
Return to [Main Page](https://github.com/Xilinx/Xilinx_KV260_Workshop)

Go to Part 1
 - [Windows](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%201:%20Setup%20Board.md)
 - [Linux](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Linux%20set-up.md)
 - [Mac](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Mac%20set-up.md)


Go to [Part 2: Exploring the Different AAs](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%202:%20Exploring%20the%20Different%20AAs.md)

Go to [Part 3: Running through AA1](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%203:%20Running%20through%20AA1.md)

Go to [Part 4: Optional Demo](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%204:%20Optional%20Demo.md) 

------------------------------------------------------
&copy; Copyright 2021 Xilinx, Inc. All rights reserved.
