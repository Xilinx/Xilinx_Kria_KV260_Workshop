# Part 4: Optional Demo

Depending on time, you may complete this demo at home. 

As you have seen that there are three AI models provided here via `–aitask` command line option:
- facedetect (densebox_320_320)
-  refinedet (refinedet_pruned_0_96)
-  ssd (ssd_adas_pruned_0_95) 
  
Currently there are a limited number of Vitis AI models that can be used for the SOM board. On the model zoo site, please locate one of the three model types from this [library](https://www.xilinx.com/html_docs/vitis_ai/1_3/lib_samples.html#tgh1565815780213)
 - Face Detection
 - SSD Detection
 - RefineDet Detection

Identify a model you will want to swap it out for.

## Part A: (30 minutes)
You will want to generate and donwload the updated model files where you have Vitis-AI installed (locally or via [AWS](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/How%20to%20connect%20to%20AWS.md))

### Identifying Model
- Go to [Model Zoo](https://github.com/Xilinx/Vitis-AI/tree/master/models/AI-Model-Zoo/model-list) link, and you will select a model of your choice. 
  - For example, we will look at the **ssd_pedestrian_pruned_0_97**. Select that folder and open the "model.yaml" file.
- Copy the URL link under the board: **GPU**. This link will have the float & quantized files that you will use to deploy the model for the SOM. 
- Copy the URL link under the board: **ZCU104 and ZCU102**. This will have the prototxt files you will need.
- Unzip the files on your local computer or via AWS. 
- You will locate the "deploy.prototxt" and "deploy.caffemodel" in the `/<model_name>/quantized` folder. These will be used later.

### Using Vitis-AI
Next, we will open it in Vitis-AI via terminal. 
```
cd Vitis-AI
./docker_run.sh xilinx/vitis-ai-cpu:latest
```

You will see the following image in the terminal
<img src="/images/Vitis-AI homepage.JPG">

If you download the model, you may need to update the model so that the fingerprint between the board and the model match. You can do this by re-compiling the model in Vitis-AI.

Once you have opened Vitis-AI, you will enter in the following commands. You will need to look up the specific framework of your model and then activate that workflow in Vitis-AI.

```
## Caffe
conda activate vitis-ai-caffe

## Tensorflow 1.15
conda activate vitis-ai-tensorflow

## Tensorflow 2.3
conda activate vitis-ai-tensorflow2 

## PyTorch
conda activate vitis-ai-pytorch 
```

Locate the quantized folder within Vitis-AI. You may need to move the folder within the Vitis-AI folder on your computer. The Vitis-AI folder should be located on your Desktop or wherever you saved it.

Before continuing, you will want to create an **arch.json** with an updated fingerprint. Write the json file as below:
```
{
    "fingerprint":"0x1000020F6014406"
}
```

### Compiling the model within Vitis-AI
Then you will run the command, depending on the framework: 

```
## For Caffe

vai_c_caffe -p </PATH/TO/deploy.prototxt> -c </PATH/TO/deploy.caffemodel> -a /
<PATH/TO/arch.json> -o </OUTPUTPATH> -n <netname>

## For Tensoflow

vai_c_tensorflow -f </PATH/TO/quantize_eval_model.pb> <PATH/TO/arch.json> -o </OUTPUTPATH> -n <netname>

## Pytorch

vai_c_xir -x /PATH/TO/quantized.xmodel -a /PATH/TO/arch.json -o /OUTPUTPATH -n netname}
```

- The deploy.prototxt and deploy.caffemodel or the quantize_eval_model.pb will be from the zip files.
- The arch.json file will be the same file you wrote above.
- Make sure to output the results to a path you can locate
- netname will be the 'pre-fix' for your output files. 


For example the following command is for employing the **"ssd_pedestrian_pruned_0_97"** model: 
```
vai_c_caffe -p ssd_pedestrian_pruned_0_97/quantized/deploy.prototxt -c ssd_pedestrian_pruned_0_97/quantized/deploy.caffemodel 
-a arch.json -o compile_model -n ssd_pedestrian_pruned_0_97
```

Now we will copy the information/files from Vitis-AI to the SOM board:
1. Locate the xmodel in the netname folder on your local computer. You will copy this xmodel onto your SD card or scp the xmodel over to the SOM. You will also move the label.json, prototxt, and md5sum folder to the SOM as well.
2. Place the three/four files (xmodel, prototxt, md5sum file, and/or label.json file) into a folder with the model name you want to use (i.e. ssd_pedestrian_pruned_0_97), and place that folder into the following directory: `/opt/xilinx/share/vitis_ai_library/models/kv260-smartcam`. This will swap the model only for the smartcam. If you want to update the AA2 models, you will update the `kv260-smartcam` to `kv-aibox-reid`.
3. Locate the "md5sum.txt" in your model folder, and note the string within the file. Copy this string for later.

## To use the new model for AA1
To use AA1 with a new .xmodel, you will update the following files.
1. Go to the following path: /opt/xilinx/share/ivas/smartcam/facedetect/aiinference.json
2. Edit the file via `sudo vi`

```
  {
        "ivas-library-repo": "/usr/lib/",
            "element-mode":"inplace",
            "kernels" :[
            {
                "library-name":"libivas_xdpuinfer.so",
                "config": {
                    "model-name" : "refinedet_pruned_0_96",
                    "model-class" : "REFINEDET",
                    "model-path" : "/opt/xilinx/share/vitis_ai_library/models/kv260-smartcam",
                    "run_time_model" : false,
                    "need_preprocess" : false,
                    "performance_test" : false,
                    "debug_level" : 0
                }
            }
            ]
    }
```

3. In the above code, update the “model-name” and “model-path” with the name of the new model, and the path of new model. `${model-path}/${model-name}/${model-name}.xmodel.` In most cases, the path will stay the same. For example, we will change model-name to **ssd_pedestrian_pruned_0_97** and keep the same model-path name. 

4. Going to the same folder where .xmodel is, update the md5sum.txt file with updated string from m5sum.txt within Vitis-AI.

After you've completed these steps, you will run through the AA1 workflow as defined in [Part 2](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%202:%20Exploring%20the%20Different%20AAs.md) or [Part 3](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%203:%20Running%20through%20AA1.md)


## Part B: (1-2 hours - coming soon)
Instead of providing the files from Part A, you will be compiling the files yourself. 

Jump to [summary](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Takeaways.md) slide

Return to [Main Page](https://github.com/Xilinx/Xilinx_KV260_Workshop)


### Notes from Vitis AI

Model Download
Please visit model-list in this page. You will get downloadlink and MD5 of all the released models, including pre-compiled models running on different platforms. 
[List of models](https://github.com/Xilinx/Vitis-AI/tree/master/models/AI-Model-Zoo/model-list)

------------------------------------------------------
&copy; Copyright 2021 Xilinx, Inc. All rights reserved.
