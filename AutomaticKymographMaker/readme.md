# AutomaticKymographMaker

This is the software for our kymographs creation. This code runs with MATLAB 2020 or later version. 


## Required files: 
To run this software, you first need to download individual segmented cells from Peta???Library. The segmented cells are in .mat format. As an example, 1149_100R_100G_25_deg_001_C.mat.  These are our individual cell data segmented out directly from the live microscopy image file (.nd2 file). 


## How to do an initial test run?
1. Open MainSingle.m in MATLAB.  
2. In MainSingle.m, Specify the file path of segmented cell.mat (format: 1XXX_100R_100G_XX_deg_00X_XX.mat) in **data_path** line.  
3. For a initial test run, you can run the code without changing anything else other than the **data_path**.  
4. For the input prompt: "Please review the rough detection results and decide the (valid) frames to make kymographs.
Hit continue after you are done."   
First frame to fit? 127    (For **1149_100R_100G_25_deg_001_C.mat**, enter **127** as first frame to fit).  
Last frame to fit? 266     (For **1149_100R_100G_25_deg_001_C.mat**, enter **266** as last frame to fit).  
5. The code will save your inputs and automatically creates movies and generates multiple kymographs.  
6. All outputs are saved in a new directory "Single Kymograph Data", under the previously specified **data_path**.


## What does this code output? 

1. A movie of the individual cell in all frames, with all possible cut7 spots labeled by a yellow circle. In the movie, the most likely two SPB locations are denoted by a red "x" and a blue "x". This is the initial movie for the user to review which frame interval are suitable for kymograph creation. 
2. A valid frame list that shows all the image frames with two cut7 spots for references.   

After the user deciding the good frames interval to make kymograph, this code will output: 
1. Two movies of the good frame interval, one for each channel (red/green), with blue and red circle denoting two cut7 peak position and a yellow line representing the spindle axis.   
2. Position of both cut7 peaks, both rough and precise, in .mat format. They will be used for later analysis.  
3. Multiple cut7 and MT kymographs. including:   
3.1 Individually optimized kymographs for each color channel.  
3.2 bkg_subtracted_kymograph, in .mat format. It will be used for later analysis.   
3.3 cut7_kymographs and MT_kymographs in .mat format. They can be used for analysis.  
3.4 cut7_kymographs and MT_kymographs with cut7 peak position labels on top as red and blue dots.  
3.5 Optimized paired kymographs for both channels.  
3.6 A mixed-color (red + green) kymograph for both channels.  


## Advanced (batch producing kymographs for all cells for a single mutant). 

When all cells cut7 peak positions are known and saved as pos_cut7_pk.mat, the code can be running in batch mode. The data path to both pos_cut7_pk.mat and segmented_cell.mat need to be specified before running. In the code, their path are assigned to *data_path_pos* and *data_path_mov*. User can download existing pos_cut7_pk.mat and segmented_cell.mat from our original data file library to perform a test run. 



