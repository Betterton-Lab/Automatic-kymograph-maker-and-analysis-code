%% This code make kymographs for a single segmented cell. 

%  By LuKeZ, last modified: 8-29-2023

%  To run this code, you need to: 
%  1. Specify the file path of segmented cell.mat (format: 1***_100R_100G_25_deg_00*_**.mat) in data_path line.
%  2. Defining a intensity threshold and a size limit for picking out cut7 spot,
%  using the function FindRoughPos(movie4D, threshold, spot_size) in this code. 
%  (Code's default: 3 sigma above background, 3 pixel in radius, i.e. FindRoughPos(movie3D_cut7, 3, 3);
%  3. Determining the "valid frames" where both cut7 spots are detected in the movie. 
%  The code will automatically fit a best spot location for both cut7 spots in every "valid frame". 

%  Initial outputs: 
%  1. A movie of the individual cell in all frames, with all possible cut7 spots labeled by a yellow circle.
%  In the movie, the most likely two SPB locations are denoted by a red "x" and a blue "x". 
%  This is the initial movie for the user to review which frame interval are suitable for kymograph creation. 
%  2. A valid frame list that shows all the image frames with two cut7 spots for references. 
%  
%  After the user deciding the good frames interval to make kymograph, this code will output: 
%  1. Two movies of the good frame interval, one for each channel (red/green), with blue and red circle 
%  denoting two cut7 peak position and a yellow line representing the spindle axis. 
%  2. Position of both cut7 peaks, both rough and precise, in .mat format. They will be used for later analysis. 
%  3. Multiple cut7 and MT kymographs. including: 
%  3.1 Individually optimized kymographs for each color channel. 
%  3.2 bkg_subtracted_kymograph, in .mat format. It will be used for later analysis. 
%  3.3 cut7_kymographs and MT_kymographs in .mat format. They can be used for analysis.
%  3.4 cut7_kymographs and MT_kymographs with cut7 peak position labels on top as red and blue dots. 
%  3.5 Optimized paired kymographs for both channels.
%  3.6 A mixed-color (red + green) kymograph for both channels. 


%% Load .ND2 Data (Segmented Cells.mat)
% Note, for test run, the good frames for '1149_100R_100G_25 deg_001_C.mat'
% are frame 127 (first) - frame 266 (last)
data_path = 'C:\Research\Data\cut7_FL\pkl1_klp2_WT\Segmented Cells\1149_100R_100G_25 deg_001_C.mat';

% data_path = 'C:\Research\Data\cut7_1032_TD\pkl1_klp2_WT\Segmented Cells\1125_100R_100G_25_deg_006_F.mat';

% data_path = 'C:\Research\Data\cut7_1017_TD\pkl1_klp2_WT\Segmented Cells\1142_100G_100R_25 deg_005_C.mat';

% data_path = 'C:\Research\Data\cut7_internalD\pkl1_klp2_WT\Segmented Cells\1168_100R_100G_25_deg_006_F.mat';

% data_path = 'C:\Research\Data\cut7_FL\pkl1D_klp2D\Segmented Cells\1162_100R_100G_25_deg_005_F.mat';

% data_path = 'C:\Research\Data\cut7_1032_TD\pkl1D_klp2D\Segmented Cells\1210_100R_100G_25_deg_001_8.mat';

% data_path = 'C:\Research\Data\cut7_1017_TD\pkl1D_klp2D\Segmented Cells\1207_100R_100G_25_deg_003_28.mat';

% data_path = 'C:\Research\Data\cut7_1006_TD\pkl1D_klp2D\Segmented Cells\1238_100R_100G_25_deg_003_E.mat';

% data_path = 'C:\Research\Data\cut7_988_TD\pkl1D_klp2D\Segmented Cells\1131_100R_100G_25_deg_001_3.mat';

%% Testing data, cut7 phospho: 
% data_path = 'C:\Research\Data\test data\FLSS\1199_100R_100G_25 deg_002_I.mat';

%% Cut7 Phospho mutants: 
% FL-9A
% data_path = 'C:\Research\Data\cut7_phospho\FL\9A\Segmented Cells\1201_100R_100G_25 deg_003_K.mat';
% FL-9D
% data_path = 'C:\Research\Data\cut7_phospho\FL\9D\Segmented Cells\1203_100R_100G_25 deg_004_D.mat';
% FL-SS
% data_path = 'C:\Research\Data\cut7_phospho\FL\SS\Segmented Cells\1199_100R_100G_25 deg_003_E.mat';
% 1030TD-9A
% data_path = 'C:\Research\Data\cut7_phospho\1030TD\pkl1_klp2_WT\9A\Segmented Cells\1183_100R_100G_25 deg_003_H.mat';
% 1030TD-9D
% data_path = 'C:\Research\Data\cut7_phospho\1030TD\pkl1_klp2_WT\9D\Segmented Cells\1185_100R_100G_25 deg_004_F.mat';
% 1030TD-SS
% data_path = 'C:\Research\Data\cut7_phospho\1030TD\pkl1_klp2_WT\SS\Segmented Cells\1181_100R_100G_25 deg_003_I.mat';


%% Using TAMiT results: 
% data_path = 'C:\Research\Data\cut7_motordead\Segmented Cells\1136_100R_100G_25 deg_004_18.mat';
% SPB_pos_path = 'C:\Research\Data\cut7_motordead\TAMIT Output\004_18';
% SPB_fullpath = fullfile(SPB_pos_path, 'sid4_positions.mat');
% load(SPB_fullpath);
% clear SPB_fullpath;
% clear SPB_pos_path; 

% This code loads in the image data and will find a rough cut7 locations.
% It store the rough location into pos_cut7_pk_rough.mat
% It store the refined location into pos_cut7_pk.mat

% Add path to accessory functions
addpath(genpath('functions'))

%% Loading ImageObj and cut7/MT movies
ImageObj = ImageData.InitializeFromCell(data_path);
movie5D = ImageObj.GetImage();   % Both channel = 5D
% Getting spatial and temporal dimension of the data
pixel_size = ImageObj.GetSizeVoxels;
time_step = ImageObj.GetTimeStep;
movie3D_MT = double(movie5D(:,:,:,:,1));
movie3D_cut7 = double(movie5D(:,:,:,:,2));
% % movie4D = double(movie5D(:,:,:,:,2));
clear movie5D;

% Make a separate directory to store outputs
if ~exist("Single Kymograph Data", 'dir')
    mkdir("Single Kymograph Data");
end
cd 'Single Kymograph Data';

%% Find Cut7 Peak Position and Make Cut7 Kymograph
% Find a rough location of cut7 spot (threshold = n * stdev)
% function pos_cut7_pk_rough = FindRoughPos(movie4D, threshold, spot_size)

pos_cut7_pk_rough = FindRoughPos(movie3D_cut7, 3, 3);

% Remove single frame NaN using previous frame position data:
FN = [   ];
if ~isempty(FN)
FN = sort(FN ,"ascend");
    for idx = 1:length(FN)
	    pos_cut7_pk_rough(:,:,FN(idx)) = pos_cut7_pk_rough(:,:,FN(idx)-1);
    end
end

% Get info on which frames have clear cut7 spot
valid_frames = getValidFrames(pos_cut7_pk_rough);
save('pos_cut7_pk_rough.mat','pos_cut7_pk_rough');

disp('Please review the rough detection results and decide the (valid) frames to make kymographs.')
disp('Hit continue after you are done.')

% % Pause the code here to specify good frames to fit spots with Gaussian 2D
prompt = " First frame to fit? ";
first_frame = input(prompt);
prompt = " Last frame to fit? ";
last_frame = input(prompt);

% Find a refined cut7 peak pos for the good frames
pos_cut7_pk = FindRefinedPos(movie3D_cut7, pos_cut7_pk_rough, first_frame, last_frame);
% Use TAMiT results directly
% pos_cut7_pk(:, 1, first_frame:last_frame) = pos_mat(:, 1, 1:end);
% pos_cut7_pk(:, 2, first_frame:last_frame) = pos_mat(:, 2, 1:end);

% % % % If swap red/blue is required for better kymograph
% temp1 = pos_cut7_pk(1,:,:);
% temp2 = pos_cut7_pk(2,:,:);
% pos_cut7_pk(2,:,:) = temp1;
% pos_cut7_pk(1,:,:) = temp2;

% % % Fix bad frames: average the spot position of the bad frame using the
% % % average position of previous and later good frames. 
% % pos_cut7_pk(:,:,35) = 0.5*(pos_cut7_pk(:,:,34)+pos_cut7_pk(:,:,36));

% % % save the cut7 peak location info, very important! 
save('pos_cut7_pk.mat','pos_cut7_pk');
% % % Make kymograph of MT and cut7, and optimize
% Automatically make the kymograph (cut7 and MT): 
Kymograph_cut7 = makeKymograph(movie3D_cut7, pos_cut7_pk, first_frame, last_frame, time_step, 'cut7');
% Make the background-subtracted kymograph: 
Kymograph_cut7_bkg_sub = subtractingBackground(Kymograph_cut7, movie3D_cut7, first_frame, last_frame);
% Make contrast-optimized kymographs: 
kymoLookBetter(Kymograph_cut7(first_frame:last_frame, :), 0.75, 0.25, 'cut7');
Kymograph_MT = makeKymograph(movie3D_MT, pos_cut7_pk, first_frame, last_frame, time_step, 'MT');
kymoLookBetter(Kymograph_MT(first_frame:last_frame, :), 200, max(Kymograph_MT(:)), 'MT');
% % Make red-green merged kymograph of MT and cut7: 
mergeKymographs(Kymograph_MT(first_frame:last_frame, :), Kymograph_cut7(first_frame:last_frame, :)); 

% % Pause for review and close all figures
cd ..;

pause(1);
close all;

