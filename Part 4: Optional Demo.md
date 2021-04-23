# Part 4: Optional Demo (in progress)

Depending on time, you may complete this demo at home. 

As you have seen that there are three AI models provided here via –aitask command line option; facedetect (densebox_320_320), refinedet (refinedet_pruned_0_96), ssd (ssd_adas_pruned_0_95) etc. But the customization can be made to use other Vitis AI models of the same class or use the retrained models by the users.

There are other AI models that you can use as listed [here](https://www.xilinx.com/html_docs/vitis_ai/1_3/lib_samples.html): 

## Part A: (30 minutes)
Here are some compiled files needed to update the models

```
cd Vitis-AI
./docker_run.sh xilinx/vitis-ai-cpu:latest
```

**image Vitis**

If you download the model, you may need to update the model so that the fingerprint between the board and the model match. You can do this by re-compiling the model in Vitis-AI.

Once you have opened Vitis-AI, you will enter in the following commands. You will need to look up the specific framework of your model and then activate that library in Vitis-AI.

```
## Caffe
conda activate vitis-ai-caffe

## Tensorflow
conda activate vitis-ai-tensorflow
```


## Part B: (1-2 hours)
Instead of providing the files from Part A, you will be compiling the files yourself. 

Jump to [summary](https://github.com/Xilinx/Xilinx_KV260_Workshop/blob/main/Takeaways.md) slide

Return to [Main Page](https://github.com/Xilinx/Xilinx_KV260_Workshop)


### Notes from Vitis AI

Model Download
Please visit model-list in this page. You will get downloadlink and MD5 of all the released models, including pre-compiled models running on different platforms. 
[List of models](https://github.com/Xilinx/Vitis-AI/tree/master/models/AI-Model-Zoo/model-list)
