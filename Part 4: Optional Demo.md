# Part 4: Optional Demo (in progress)

Depending on time, you may complete this demo at home. 

As you have seen that there are three AI models provided here via `–aitask` command line option:
- facedetect (densebox_320_320)
-  refinedet (refinedet_pruned_0_96)
-  ssd (ssd_adas_pruned_0_95) 
  
But the customization can be made to use other Vitis AI models of the same class or use the retrained models by the users.

There are other AI models that you can use as listed [here](https://www.xilinx.com/html_docs/vitis_ai/1_3/lib_samples.html): 

## Part A: (30 minutes)

You will generate and download the files where you have Vitis-AI installed (locally or via [AWS](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/How%20to%20connect%20to%20AWS.md). 

- You will download the .zip file from the following [Model Zoo](https://github.com/Xilinx/Vitis-AI/tree/master/models/AI-Model-Zoo/model-list), choose a model of your choice. 
  - For example, we will look at the **cf_landmark_celeba_96_72_0.14G_1.3**. Select that folder and open the "model.yaml" file.
- You will copy the URL link under the board: **GPU**. This link will have the float & quantized files that you will use to deploy the model for the SOM. 

<img src="/images/model_yaml.JPG">

- Unzip the files on your local computer or via AWS
- You will locate the "deploy.prototxt" and "deploy.caffemodel" in the `/<model_name>/quantized` folder. 

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

## Neptune
conda activate vitis-ai-neptune

## PyTorch
conda activate vitis-ai-pytorch 
```

Locate the quantized folder. 

Before continuing, you will want to create an **arch.json** with an updated fingerprint. Write the json file as below:
```
{
    "fingerprint":"0x1000020F6014406"
}
```

Then you will run the command, depending on the framework: 

```
vai_c_caffe -p </PATH/TO/deploy.prototxt> -c </PATH/TO/deploy.caffemodel> -a /
<PATH/TO/arch.json> -o </OUTPUTPATH> -n <netname>
```
- The deploy.prototxt and deploy.caffemodel will be from the zip files.
- The arch.json file will be the same file defined above
- Make sure to output the results to a path you can locate
- netname will be the 'pre-fix' for your output files. 

For example the following command is for employing the **"face_landmark"** model: 
```
vai_c_caffe -p cf_landmark_celeba_96_72_0.14G_1.3/quantized/deploy.prototxt -c cf_landmark_celeba_96_72_0.14G_1.3/quantized/deploy.caffemodel 
-a arch.json -o compile_model -n face_landmark
```

Now we will copy the information/files from Vitis-AI to the SOM board:
1. Locate the xmodel in the netname folder. You will copy this xmodel onto your SD card or scp the xmodel over to the SOM.
2. Locate the "md5sum.txt" in your netname, and note the string within the file. Copy this string for later.


<img src="/images/update_model_files_folder.JPG">

To update AA1 with a new .xmodel, you will update the following files.
1. Go to the path
2. Go to the following path: /opt/xilinx/share/ivas/smartcam/refinedet/aiinference.json
3. Edit the file via `sudo vi`

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
                    "model-path" : "/opt/xilinx/share/vitis_ai_library/models/kv260-aibox-reid",
                    "run_time_model" : false,
                    "need_preprocess" : false,
                    "performance_test" : false,
                    "debug_level" : 0
                }
            }
            ]
    }
```

4. In the above code, update the “model-name” and “model-path” with the name of the new model, and the path of new model. `${model-path}/${model-name}/${model-name}.xmodel.`

**NOTE** make sure that model path has at least "two files of the same name". For example: `/face_landmark/face_landmark/`

5. Going to the same folder where .xmodel is, update the md5sum.txt file with update version from above.

After you've down this, you will run through the AA1 workflow as defined in [Part 2](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%202:%20Exploring%20the%20Different%20AAs.md) or [Part 3](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Part%203:%20Running%20through%20AA1.md)


## Part B: (1-2 hours)
Instead of providing the files from Part A, you will be compiling the files yourself. 

Jump to [summary](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Takeaways.md) slide

Return to [Main Page](https://github.com/Xilinx/Xilinx_KV260_Workshop)


### Notes from Vitis AI

Model Download
Please visit model-list in this page. You will get downloadlink and MD5 of all the released models, including pre-compiled models running on different platforms. 
[List of models](https://github.com/Xilinx/Vitis-AI/tree/master/models/AI-Model-Zoo/model-list)
