%% This code loads batches of pos_cut7_pk.mat files and make kymographs
%  1. specify location of pos_cut7_pk.mat
%  2. creates folders that contains cell name (00n_X) and genotpye name
%  3. make kymographs based on pos_cut7_pk.mat and save outputs into the designated folder

addpath(genpath('functions'));

% Specify the mutant types and cells to analyze

%% Cut7 Phospho Mutants
% mutant_type = "cut7_phospho\FL\9A";
% data_list = ["001_A","001_B","002_A","002_B","002_C","002_D","002_E","002_F","002_G",...
%              "003_A","003_B","003_C","003_D","003_E","003_F","003_G","003_H","003_I","003_J","003_K"];

% mutant_type = "cut7_phospho\FL\9D";
% data_list = ["002_B","002_C","002_D","002_E","002_F","002_G",...
%              "003_A","003_B","003_D","003_E","003_F","003_G","003_H",...
%              "004_A","004_B","004_C","004_D"];

% mutant_type = "cut7_phospho\FL\SS";
% data_list = ["001_A","001_B","001_C","001_D","001_E","001_F","001_G","001_H",...
%              "002_A","002_B","002_C","002_D","002_E","002_F","002_G","002_I",...
%              "003_A","003_B","003_C","003_E"];
% 
% mutant_type = "cut7_phospho\1030TD\9A";
% data_list = ["001_A","001_B","001_C","001_D","001_E","001_F",...
%              "002_B","002_C","002_D","002_E",...
%              "003_A","003_B","003_C","003_D","003_E","003_F","003_G","003_H"];

% mutant_type = "cut7_phospho\1030TD\9D";
% data_list = ["001_A","001_B","001_C","001_D","001_E",...
%               "002_A","002_B","002_C","003_A","003_B","003_C",...
%               "004_B","004_C","004_D","004_E","004_F"];

% mutant_type = "cut7_phospho\1030TD\SS";
% data_list = ["001_A","001_B","001_C","001_D","001_E","001_F",...
%              "002_A","002_B","002_C","002_D","002_E","002_F","002_G",...
%              "003_A","003_B","003_C","003_D","003_E","003_F","003_G","003_H","003_I"];

%% Cut7 Truncation Mutants - Kinesin 14 WT
mutant_type = "cut7_FL\pkl1_klp2_WT";
data_list = ["001_A","001_B","001_C","001_D","001_E",...
             "002_A","002_B","002_C","002_D",...
             "003_A","003_B","003_C","003_D",...
             "004_A","004_B","004_C","004_D","004_E","004_F",...
             "005_A","005_B","005_C","005_D","005_E","005_F","005_G","005_H","005_I","005_J"];

% mutant_type = "cut7_1032_TD\pkl1_klp2_WT";
% data_list = ["001_A","001_B","001_C","002_A","002_B","002_C","002_D","002_E","002_F",...
%     "003_A","003_B","003_C","003_D","003_E","003_F","003_G",...
%     "004_A","004_B","004_C","004_D","004_E","004_G",...
%     "005_B","005_C","005_D","005_E","005_F","005_G",...
%     "006_A","006_B","006_C","006_D","006_E","006_F"];

% mutant_type = "cut7_1017_TD\pkl1_klp2_WT";
% data_list = ["001_A","001_B","001_C","001_D","002_A","002_B","002_C",...
%             "003_A","003_B","003_C","003_D","003_F","003_H",...
%             "004_A","004_B","004_D","004_E","004_F","004_G","004_H","004_I"...
%             "005_A","005_B","005_C","005_D","005_E","005_F","005_G","005_H"];

% mutant_type = "cut7_internalD\pkl1_klp2_WT";
% data_list = ["001_A","001_B","001_D",...
%     "002_A","002_C","002_D","002_E","002_F",...
%     "003_A","003_B","003_C","003_D","003_E",...
%     "004_A","004_B","004_C","004_D",...
%     "005_A","005_B","005_C","005_D","005_E","005_F","005_G"...
%     "006_A","006_B","006_C","006_D","006_E","006_F"];

%% Cut7 Truncation Mutants - Kinesin 14 Del

% mutant_type = "cut7_FL\pkl1D_klp2D";
% data_list = ["001_1","001_2","001_3","001_4","001_7","001_8","001_9","001_10","001_12",...
%     "002_19","002_20","002_21",...
%     "003_22","003_24","003_25","003_26","003_28","003_29","003_30","003_31","003_32","003_34",...
%     "004_A","004_B","004_C","004_D","004_E","004_F","004_H",...
%     "005_B","005_C","005_D","005_E","005_F","005_H","005_I","005_K","005_L"...
%     "006_A","006_C","007_C","007_D","007_F","007_G"];

% mutant_type = "cut7_1032_TD\pkl1D_klp2D";
% data_list = ["001_1","001_2","001_3","001_5","001_6","001_7","001_8","001_9","001_10",...
%              "002_11","002_12","002_13","002_15","002_16","002_17","002_19",...
%              "003_20","003_22","003_24","003_25","003_26","003_27","003_28",...
%              "004_30","004_32","004_34","004_35","004_37","004_38","004_39",...
%              "005_A","005_B","005_C","005_D"];

% mutant_type = "cut7_1017_TD\pkl1D_klp2D";
% data_list = ["001_1","001_2","001_3","001_4","001_6","001_7","001_8","001_9","001_10",...
%     "002_11","002_12","002_13","002_14","002_15","002_16","002_17","002_18","002_19",...
%     "003_21","003_22","003_23","003_24","003_25","003_26","003_27"];
% data_list = ["004_30","004_31","004_32","004_33","004_34","004_35","004_36","004_37","004_38","004_39"];

% mutant_type = "cut7_1006_TD\pkl1D_klp2D";
% data_list = ["001_A","001_B","001_C","002_A","002_B","002_C","002_D","002_E"...
%     "003_A","003_B","003_C","003_D","003_E"];

% mutant_type = "cut7_988_TD\pkl1D_klp2D";
% data_list = ["001_22","001_23","001_24","001_25",...%"001_1","001_2","001_3","001_4","001_5","001_6",...%,"001_22","001_23","001_24","001_25",...
%              "002_26","002_27","002_28",...%"002_7","002_8","002_9",...%"002_26","002_27","002_28",...
%              "003_29","003_30",...%"003_11","003_12","003_13","003_14","003_15",...%"003_29","003_30",...
%              "004_31","004_32","004_33","004_34","004_35","004_36",...%"004_16","004_17","004_18","004_19","004_20"];% "004_31","004_32","004_33","004_34","004_35","004_36",...
%              "005_37","005_38","005_39","005_40","005_41","005_42"];


% This is the path to cut7_pos_peak.mat and the cut7 movies
data_path_pos = "C:\Research\Data\" + mutant_type + "\Kymographs\" + data_list + "\pos_cut7_pk.mat";
data_path_mov = "C:\Research\Data\" + mutant_type + "\Segmented Cells\1149_100R_100G_25 deg_" + data_list + ".mat";

% Make a separate directory to store outputs
if ~exist("Saved Data", 'dir')
    mkdir("Saved Data")
end
cd 'Saved Data'
mkdir(mutant_type);
cd ..

% load pos_cut7_pk.mat and batch make kymographs

for idx = 1 : length(data_list)
    disp(" ");
    disp(strcat("Currently working on:  ", data_list(idx)));
    % Loading ImageObj and cut7/MT movies
    ImageObj = ImageData.InitializeFromCell(convertStringsToChars(data_path_mov(idx)));
    movie5D = ImageObj.GetImage();   % Both channel = 5D
    % Getting spatial and temporal dimension of the data
    pixel_size = ImageObj.GetSizeVoxels;
    time_step = ImageObj.GetTimeStep;
    % Getting MT and cut7 channel movie (red/green)
    movie3D_MT = double(movie5D(:,:,:,:,1));
    movie3D_cut7 = double(movie5D(:,:,:,:,2));
    clear movie5D;
    clear ImageObj;
    
    % Loading the cut7 spot location file (pos_cut7_pk.mat)
    load(data_path_pos(idx));
% %     % % Debug swap SPB locations (optional) 
% %     temp1 = pos_cut7_pk(1,:,:);
% %     temp2 = pos_cut7_pk(2,:,:);
% %     pos_cut7_pk(2,:,:) = temp1;
% %     pos_cut7_pk(1,:,:) = temp2;

    %% Debug Single Frame: 
    SingleFrame = [];
    if ~isempty(SingleFrame)
        mesg = ['The cut7 position in frames ', num2str(SingleFrame),...
                ' will be calculated using the average position with their adjacent frames'];
        disp(mesg);
        pos_cut7_pk(:,:,SingleFrame) = (1/2) * (pos_cut7_pk(:,:,SingleFrame+1)+pos_cut7_pk(:,:,SingleFrame-1));
    end

    % First non-zero element in pos_cut7_pk.mat, use it as the first frame for the kymograph
    first_frame = (3 + find(pos_cut7_pk~=[0 0; 0,0], 1, 'first'))/4;
    last_frame = size(pos_cut7_pk, 3);
    % Save data in the appopriated folder
    cd 'Saved Data\';
    cd(mutant_type);
    mkdir(data_list(idx));
    cd(data_list(idx));
    save("pos_cut7_pk.mat", "pos_cut7_pk");

    % Automatically make the kymograph (cut7 and MT)
    Kymograph_cut7 = makeKymograph(movie3D_cut7, pos_cut7_pk, first_frame, last_frame, time_step, 'cut7');
    % Make the background-subtracted kymograph: 
    Kymograph_cut7_bkg_sub = subtractingBackground(Kymograph_cut7, movie3D_cut7, first_frame, last_frame);
    % Save a copy outside the folder
    cd ..\
    out_filename_png = strcat(data_list(idx), ' kymograph.png');
    exportgraphics(gcf, out_filename_png);
    out_filename_fig = strcat(data_list(idx), ' kymograph.fig');
    saveas(gcf, out_filename_fig);
    cd(data_list(idx));
    % Automatic Image Optimization
    kymoLookBetter(Kymograph_cut7(first_frame:last_frame, :), 0.75, 0.25, 'cut7');
    % MT Channel (Optional)
    Kymograph_MT = makeKymograph(movie3D_MT, pos_cut7_pk, first_frame, last_frame, time_step, 'MT');
    kymoLookBetter(Kymograph_MT(first_frame:last_frame, :), 200, max(Kymograph_MT(:)), 'MT');
    % Make the two-colored kymograph (Optional)
    mergeKymographs(Kymograph_MT(first_frame:last_frame, :), Kymograph_cut7(first_frame:last_frame, :));

    % Back to home directory for the next analysis
    cd 'C:\Research\Softwares\Kymographs Maker\BatchKymographMaker\';
    close all;
    disp("Kymograph Completed!");
    disp(" ");


end

