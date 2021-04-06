# How to connect to AWS

This section covers how to connect to an AWS instance. This instance will have the tools and files pre-installed that you can access remotely.

The AWS environment is configured with the following tools and files:
 -  Petalinux 2020.2
 -  Vitis 2020.2
 -  Vivado 2020.2 

To access it via Putty, you will need to download the following tools beforehand: 
- (puTTY)[https://www.chiark.greenend.org.uk/~sgtatham/putty/]


## Windows
You want to download WinSCP for Windows file transfer

[WinSCP Downloads](https://winscp.net/eng/download.php)


Open WinSCP

When you open WinSCP, you can select SCP for File protocol. 

You will enter in the host name, username, and password as provided by your workshop coordinator. Port 22 is the default port number.

You can transfer the files by selecting the desired file and dragging it over to the desired window. This will transfer the file via SCP.

## Linux & Mac
For linux & mac, you will use scp

enter the following command into the terminal: 
```
scp [username]@[IP_address]:[path to file] [path toe destination]
```
You will need to enter the password to access the files.

The user name and IP address will be provided by the workshop coordinator
