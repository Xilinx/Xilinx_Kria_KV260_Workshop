This document outlines important questions and solutions you may need when working with the SOM board

[Xmutil Commands](#Xmutil-Commands)

[Potential Issues and Resolutions](#Potential-Issues-and-Resolutions)

# Xmutil Commands
Platform Management utility (xmutil) commands help configure and work the SOM board. You can refer to the table below for the command and description. This table comes from UG 1089

| Utility Function  | Description |
| ------------- | ------------- |
| xmutil boardid|Reads all board EEPROM contents. Prints information summary to command line interface.  |
|xmutil bootfw | Reads primary boot device information. Prints A/B status information, image IDs, and checksums to command line interface.|
|xmutil bootfwupd| Tool for updating the primary boot device with a new boot image in the inactive partition.|
|xmutil getpkgs |Queries Xilinx package feeds and provides a summary to the debug interface of relevant packages for the active platform based on board ID information.|
|xmutil listapps | Queries on the target hardware resource manager daemon of pre-built applications that are available on the platform and provides a summary to the debug interface.|
|xmutil loadapp | Loads the integrated HW+SW application inclusive of the bitstream, and starts the corresponding pre-built application software executable.|
|xmutil unloadapp| Removes accelerated application inclusive of unloading its bitstream.|
|xmutil perfmon| Reads and prints a summary of the following performance related information: CPU frequency, RAM usage, temperature, and power information.|
|xmutil ddrqos | Utility for changing configuration of PS DDR quality of service (QoS) settings including. Initial implementation focuses on PS DDR memory controller traffic class configuration.|
|xmutil axiqos | Utility for changing configuration of PS/PL AXI interface quality of service (QoS) settings. Initial implementation focuses on AXI port read/write priority configurations. |
|xmutil bist | Built-in self-test (BIST) utility for simple board diagnostics with pass/fail summary.|

<br><br>

# Potential Issues and Resolutions
This table lists out potential issues you may encounter, and how to resolve them. 
| Issue  | Resolution |
| ------------- | ------------- |
| How do I find a USB camera device?| Use the command `ls /dev/media*` to list the cameras|
| There is a heartbeat LED active, but UART isn't responding.  |Verify that your machine has a FTDI driver installed and that the terminal is connected to the correct COM port.  |
| "Device is not ready" | After invoking the command xmutil loadapp to load firmware, it needs several seconds for the whole firmware to be ready. If you invoke the smartcam application before it is ready, it may report errors about devices readiness.  |
| MIPI or VCU not loaded| Make sure that you have entered the command `xmutil loadapp kv260-smartcam`|
| Something previously loaded | Make sure to unload the current application via `sudo xmutil unloadapp` |
|- ERROR: Device x is not ready. <br> - ERROR: MIPI device x is not ready. <br> - ERROR: Device x is not USB cam.| You have entered the wrong media index, calling a MIPI camera as a USB or vice versa. Please check the type of camera you are using.|
|Monitor doesn't look like it's connected| Use the command `modetest -M xlnx` to check the status of the connected monitor.|
|- `ERROR: memory leak` <br> - `xlnx_snd_card xlnx_snd_card.1.auto: ASoC: failed to init link xilinx-i2s_playback: -517` <br> - `xlnx_snd_card xlnx_snd_card.1.auto: xlnx-i2s-snd-card-0 registration failed`| These are Benign Errors messages|


