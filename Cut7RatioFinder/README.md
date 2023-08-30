# Cut7RatioFinder
This code finds the cut7 midzone pole ratio as function of time, for each cut7 mutant. Required input files are pos_cut7_pk.mat and segmented_cell.mat (e.g. 1149_100R_100G_25 deg_001_C.mat) for each individual cell. 

The codes are written for analyzing collection of cells. Users need to check that their _data_path_pos_ and _data_path_mov_ are correct path to the input files for the code to run properly. In MATLAB: 

1. Run findRegions.m, this program defines cut7 pole region and cut7 midzone region, for later analysis.
2. Run CalcMidPoleRatio.m, the program will calculate the total cut7 at the midzone and at the poles, and their ratios. 
3. Run CalcRatioByTime.m, for a specific cut7 mutant. The program will plot the average midzone to pole ratio as a function of time for the mutant selected.
   Note that _frame_list_ and _frame_time_ need to be manually specified.  
   _frame_list_ is the list of anaphase onset frame, for each cell.   
   _frame_time_ defines the time in seconds for each adjacent frames.   

As the code's default, cut7-FL-GFP, Kin14 WT, the list of cell data, anaphase onset frame, and frame to real time conversion are defined below: 
```
mutant_type = "cut7_FL\pkl1_klp2_WT";
data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
data_list = ["001_A","001_D","001_E","002_A","003_A","003_B","003_D","004_D"...
             "005_A","005_B","005_E","005_F","005_G","005_J"];
% Anaphase onset frames: 
frame_list = [86, 179, 155, 51, 126, 40, 66, 30, 36, 69, 42, 117, 129, 148];
% Convert frame time to real time in seconds: 
frame_time = [9.1432, 9.1432, 9.1432, 9.0831, 9.0394, 9.0394, 9.0394, 9.1104, 8.598, 8.598, 8.598, 8.598, 8.598, 8.598];

```

4. Finally, after finish running CalcRatioByTime.m for each individual mutant, one can run PlotRatioVTime.m for all mutants combined plot. 
