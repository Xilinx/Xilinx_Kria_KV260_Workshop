# Xilinx KV260 Workshop
<img src="/images/xilinx-kria-color-cmyk-logo.jpg" width = 200 height = 100>

This repository is designed to set up the KV260 Starter kit board, and then run Accelerated Applications (AA) on the SOM board. In each section, you will learn how to integrate Xilinx SOM board with AI and Smart Camera applications. You can take what you've learned here to your own projects and applications.

The KV260 incorporates a Zynq® UltraScale+™ MPSoC, run-time memory, non-volatile boot devices, integrated power solution, and security module. The vision-focused SOM carrier card includes various application peripheral options such as camera, sensor inputs, video display outputs, USB, SD card, and Ethernet interfaces.

## Part 1: Setup Board
In this part, you will connect the cables, camera, and SD card to the board and boot the SOM via pre-installed image. The terminal will open automatically when everything is connected.

Go to Part 1: 
 - [Windows](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%201:%20Setup%20Board.md)
 - [Linux](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Linux%20set-up.md)
 - [Mac](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Mac%20set-up.md)
 
## Part 2: Exploring the Different AAs
In this part, you will see the various Accelerated Applications available on the SOM board. We will explore smart camera, AI box, and Defect Detection (coming soon).

[Go to Part 2](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%202:%20Exploring%20the%20Different%20AAs.md)


## Part 3: Running through AA1
In this part, you will be diving deeper into AA1, the Smart Camera application. We will explore the different ways to source a video feed and how to stream it across different platforms such as HDMI, DP, or RTSP.

[Go to Part 3](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%203:%20Running%20through%20AA1.md)

## Part 4: Optional Demo
This section is optional, and will dive into how to load new models onto the SOM board. 

[Go to Part 4](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%204:%20Optional%20Demo.md)

## Additional Resources
Please refer to the links below to learn more about the SOM carrier card, how to connect via Amazon Web Services (AWS), or go to Xilinx's homepage.

 - More information on the Accelerated Applications [AAs](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Accelerated%20Applications.md)
 - If you have any questions or issues, you can refer to the [FAQs](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/FAQ.md)
 - Learn more about the [SOM Board](https://www.xilinx.com/products/som/kria.html) and any [technical documents](https://www.xilinx.com/products/som/kria/kv260-vision-starter-kit.html#documentation) or [datasheets](https://www.xilinx.com/support/documentation/data_sheets/ds986-kv260-starter-kit.pdf)
 - Learn more about the [Commercial SOM](https://www.xilinx.com/products/som/kria/k26c-commercial.html) or [Industrial SOM](https://www.xilinx.com/products/som/kria/k26i-industrial.html)
 - Please visit Xilinx's [website](https://www.xilinx.com/about/company-overview.html) to learn more about the company and industrial products
 

- (c) Copyright 2021 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
Copyright Notice and Disclaimer for All Xilinx Software Programs and Files
XILINX INTERNAL Page 5 of 5
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES
