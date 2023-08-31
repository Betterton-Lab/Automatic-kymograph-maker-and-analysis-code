# AutomaticKymographAnalyzer
This is the software for our kymographs intensity profile analysis. This code runs with MATLAB 2020 or later version. 

## Required files: 
To run this software, you first need outputs from AutomaticKymographMaker. Specifically, the bkg_subtracted_kymograph.mat and the pos_cut7_pk.mat for each cell. 

## How to do an initial test run?
Open AutoExtractStripeMain.m in MATLAB. In AutoExtractStripeMain.m, users need to modify data_path and data_list to their own input bkg_subtracted_kymograph.mat and the pos_cut7_pk.mat file path location.  
For example, as the code's default: 

```
mutant_type = "cut7_FL\pkl1_klp2_WT";  
data_path = "C:\Research\Softwares\Kymographs Maker\BatchKymographMaker\Saved Data\" + mutant_type + "\";  
data_list = ["001_A","001_B","001_C","001_D","001_E",...  
             "002_A","002_B","002_C","002_D",...  
             "003_A","003_B","003_C","003_D",...  
             "004_A","004_B","004_C","004_D","004_E","004_F",...  
             "005_A","005_B","005_C","005_D","005_E","005_F","005_G","005_H","005_I","005_J"];  
```

The above code is telling the software to look for files for analysis in   

```
C:\Research\Softwares\Kymographs Maker\BatchKymographMaker\Saved Data\cut7_FL\pkl1_klp2_WT\001_A\  
C:\Research\Softwares\Kymographs Maker\BatchKymographMaker\Saved Data\cut7_FL\pkl1_klp2_WT\001_B\  
```
etc. 

If you have download the kymograph folder from CU Library: https://doi.org/10.25810/fsdf-t849, you can run this code directly on all of our kymographs. 

## What does the code output? 

- Ten seperate cut7 intensity distribution plots, with color curves representing individual image's intensity profile and thick black curve as average intensity profile, from 1 micron to 10 microns spindle length, at each integer value. 
- One combined "rainbow" plot of all the average cut7 intensity profile, for each spindle length (1-10 microns).
- Horizontal linescans extracted from the kymographs data, but with user specified spindle length (1-10 microns), stacked together in a single plot. 
- An average of all same-length horizontal linescans in a single plot.



  
