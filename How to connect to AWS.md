# How to connect to AWS

This section covers how to connect to an AWS instance. This instance will have the tools and files pre-installed that you can access remotely.

The AWS environment is configured with the following tools and files:
 -  Petalinux 2020.2
 -  Vitis 2020.2
 -  Vivado 2020.2 

The Public IP address will be provided by the workshop admin.

## Windows
Open the "Remote Desktop Connection". 

<img src="/images/rdp_windows.JPG" >

You will enter the public IP address. Afterwards, you will login into the Debian account with the username and password provided by the workshop admin. You will now be able to access the Xilinx tools and files during this workshop session.

<img src="/images/rdp_debian.JPG" >

## Linux & Mac
For linux & mac, you will use Remmina to access a Remote Desktop. 

In an Ubuntu environment, you will enter the following command in a terminal to install remmina if you do not have it.
```
sudo apt install remmina
```

If you have a different OS, you can install Remmina at the following [link](https://websiteforstudents.com/use-remmina-remote-desktop-client-rdp-on-ubuntu-16-04-18-04-lts/)

Once you have it installed, enter the following command in the terminal:
```
remmina
```
This will open the RDP as shown below.

<img src="/images/rdp_linux_open.JPG" >

Make sure to select RDP, and then you will enter the IP address as provided by the workshop admin in the following window. 

*Note*: If you have issues with the color depth, please select an option that indicates "True Color"

<img src="/images/remmina.JPG" >

Afterwards, you will login into the Debian account with the username and password provided by the workshop admin. You will now be able to access the Xilinx tools and files during this workshop session.

<img src="/images/rdp_debian.JPG" >
