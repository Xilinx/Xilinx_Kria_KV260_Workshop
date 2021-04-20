# How to SCP

## Windows
You want to download WinSCP for Windows file transfer

[WinSCP Downloads](https://winscp.net/eng/download.php)


1. Open WinSCP
2. When you open WinSCP, you can select SCP for File protocol. 
3. You will enter in the host name, username, and password as provided by your workshop coordinator. Port 22 is the default port number.

<img src="/images/winscp_image1.JPG">


4. You can transfer the files by selecting the desired file and dragging it over to the desired window. This will transfer the file via SCP.
<img src="/images/winscp_image1.JPG">

Note the hello.txt file in both windows:
<img src="/images/winscp_image3.JPG">


## Linux & Mac
For Linux & Mac, you will install remmina on your computer.

```
sudo apt install remmina
```

Log into RDP in your Remmina program. 



Enter the following command into a terminal: 
```
scp [source_username]@[source_IP_address]:[path to file] [destination_username]@[destination_IP_address]:[path to destination]
```
You will need to enter the password to access the files.

The user name is the login in for the SOM board, and the board IP_address is the found by entering ```ifconfig``` into the board terminal.

**NOTE** if you are using the AWS instance to scp files over to your local computer, use the **Public** IP address as provided by the workshop admin. This should be the same IP address you used to log in.
