%% Load .ND2 Data (Segmented Cells.mat)
data_path = 'C:\Research\Data\cut7_988_TD\pkl1D_klp2D\Segmented Cells\1131_100R_100G_25_deg_003_13.mat';
% data_path = 'C:\Research\Data\cut7_FL\pkl1_klp2_WT\Segmented Cells\1149_100R_100G_25 deg_005_C.mat';
% data_path = 'C:\Research\Data\cut7_FL\pkl1_klp2_WT\Segmented Cells\1149_100R_100G_25 deg_005_C.mat';
% data_path = 'C:\Research\Data\cut7_FL\pkl1_klp2_WT\Segmented Cells\1149_100R_100G_25 deg_005_C.mat';
% data_path = 'C:\Research\Data\cut7_FL\pkl1_klp2_WT\Segmented Cells\1149_100R_100G_25 deg_005_C.mat';
% data_path = 'C:\Research\Data\cut7_FL\pkl1_klp2_WT\Segmented Cells\1149_100R_100G_25 deg_005_C.mat';
% data_path = 'C:\Research\Data\cut7_FL\pkl1_klp2_WT\Segmented Cells\1149_100R_100G_25 deg_005_C.mat';

% This code loads in the image data and will find a rough cut7 locations.
% It store the rough location into pos_cut7_pk_rough.mat
% It store the refined location into pos_cut7_pk.mat

% Add path to accessory functions
addpath(genpath('functions'))

%% Loading ImageObj and cut7/MT movies
ImageObj = ImageData.InitializeFromCell(data_path);
movie5D = ImageObj.GetImage();   % Both channel = 5D
% Getting spatial and temporal dimension of the data
% pixel_size = ImageObj.GetSizeVoxels;
% time_step = ImageObj.GetTimeStep;
% % movie3D_MT = double(movie5D(:,:,:,:,1));
% % movie3D_cut7 = double(movie5D(:,:,:,:,2));
movie4D = double(movie5D(:,:,:,:,2));
clear movie5D;

