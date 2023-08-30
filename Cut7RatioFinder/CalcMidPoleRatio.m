% This code batch calculate the Midzone/Pole ratio
% It utilitz the masked region from step 1 (masked_region.mat)

cd 'C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\';

%% Cut7 Truncation Mutants - Kinesin 14 WT
mutant_type = "cut7_FL\pkl1_klp2_WT";
data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
data_list = ["001_A","001_B","001_C","001_D","001_E",...
             "002_A","002_B","002_C","002_D",...
             "003_A","003_B","003_C","003_D",...
             "004_A","004_B","004_C","004_D","004_E","004_F",...
             "005_A","005_B","005_C","005_D","005_E","005_F","005_G","005_H","005_I","005_J"];

% mutant_type = "cut7_1032_TD\pkl1_klp2_WT";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% data_list = ["001_A","001_B","001_C",...
%     "002_A","002_B","002_C","002_D","002_E","002_F",...
%     "003_A","003_B","003_C","003_D","003_E","003_F","003_G",...
%     "004_A","004_B","004_C","004_D","004_E","004_G",...
%     "005_B","005_C","005_D","005_E","005_F","005_G",...
%     "006_A","006_B","006_C","006_D","006_E","006_F"];

% mutant_type = "cut7_1017_TD\pkl1_klp2_WT";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% data_list = ["001_A","001_B","001_C","001_D","002_A","002_B","002_C",...
%              "003_A","003_B","003_C","003_D","003_F","003_H",...
%              "004_A","004_B","004_D","004_E","004_F","004_G","004_H","004_I"...
%              "005_A","005_B","005_C","005_D","005_E","005_F","005_G","005_H"];

% mutant_type = "cut7_internalD\pkl1_klp2_WT";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% data_list = ["001_A","001_B","001_D","002_A","002_C","002_D","002_E","002_F",...
%     "003_A","003_B","003_C","003_D","003_E","004_A","004_B","004_C","004_D",...
%     "005_A","005_B","005_C","005_D","005_E","005_F","005_G",...
%     "006_A","006_B","006_C","006_D","006_E","006_F"];


%% Cut7 Truncation Mutants - Kinesin 14 Del
% mutant_type = "cut7_FL\pkl1D_klp2D";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% % data_list = ["001_1","001_2","001_3","001_4","001_7","001_8","001_9","001_10","001_12",...
% %     "002_19","002_20","002_21",...
% %     "003_22","003_24","003_25","003_26","003_28","003_29","003_30","003_31","003_32","003_34",...
% %     "004_A","004_B","004_C","004_D","004_E","004_F","004_H",...
% %     "005_B","005_C","005_D","005_E","005_F","005_H","005_I","005_K","005_L"...
% %     "006_A","006_C","007_C","007_D","007_F","007_G"];
% % % No Protrusion List:
% data_list = ["001_2","001_8","001_9","001_10","003_22","003_24",...
%              "004_B","004_D","004_E","004_H","005_B","005_C","005_E",...
%              "006_A","006_C","007_C","007_D","007_F","007_G"];

% mutant_type = "cut7_1032_TD\pkl1D_klp2D";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% % data_list = ["001_1","001_2","001_3","001_5","001_6","001_7","001_8","001_9","001_10",...
% %              "002_11","002_12","002_13","002_15","002_16","002_17","002_19",...
% %              "003_20","003_22","003_24","003_25","003_26","003_27","003_28",...
% %              "004_30","004_32","004_34","004_35","004_37","004_38","004_39",...
% %              "005_A","005_B","005_C","005_D"];
% % % No Protrusion List:
% data_list = ["001_5","001_8","001_10","002_11","002_12","002_15","002_16","002_17",...
%              "003_22","003_24","003_28","004_38","005_A","005_B","005_D"];

% mutant_type = "cut7_1017_TD\pkl1D_klp2D";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% % data_list = ["001_1","001_2","001_3","001_4","001_6","001_7","001_8","001_9","001_10",...
% %     "002_11","002_12","002_13","002_14","002_15","002_16","002_17","002_18","002_19",...
% %     "003_21","003_22","003_23","003_24","003_25","003_26","003_27",...
% %     "004_30","004_31","004_32","004_33","004_34","004_35","004_36","004_37","004_38","004_39"];
% % No Protrusion List:
% data_list = ["001_1","001_2","001_3","001_4","001_7","001_8","001_9","001_10",...
%     "002_11","002_12","002_13","002_14","002_15","002_16","002_17","002_18",...
%     "003_21","003_22","003_23","003_24","003_25","003_26","003_27"...
%     "004_30","004_31","004_32","004_33","004_34","004_36","004_37","004_38","004_39"];

% mutant_type = "cut7_1006_TD\pkl1D_klp2D";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% data_list = ["001_A","001_B","001_C","002_A","002_B","002_C","002_D","002_E"...
%     "003_A","003_B","003_C","003_D","003_E"];

% mutant_type = "cut7_988_TD\pkl1D_klp2D";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% data_list = ["001_1","001_2","001_3","001_4","001_5","001_6","001_22","001_23","001_24","001_25",...
%              "002_7","002_8","002_9","002_26","002_27","002_28",...
%              "003_11","003_12","003_13","003_14","003_15","003_29","003_30",...
%              "004_16","004_17","004_18","004_19","004_20","004_31","004_32","004_33","004_34","004_35","004_36",...
%              "005_37","005_38","005_39","005_40","005_41","005_42"];

%% Cut7 Phospho Mutants - Kinesin 14 WT
% mutant_type = "cut7_phospho\FL\9A";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% data_list = ["001_A","001_B","002_A","002_B","002_C","002_D","002_E","002_F","002_G",...
%              "003_A","003_B","003_C","003_D","003_E","003_F","003_G","003_H","003_I","003_J","003_K"];

% mutant_type = "cut7_phospho\FL\9D";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% data_list = ["002_B","002_C","002_D","002_E","002_F","002_G",...
%              "003_A","003_B","003_D","003_E","003_F","003_G","003_H",...
%              "004_A","004_B","004_C","004_D"];

% mutant_type = "cut7_phospho\FL\SS";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% data_list = ["001_A","001_B","001_C","001_D","001_E","001_F","001_G","001_H",...
%              "002_A","002_B","002_C","002_D","002_E","002_F","002_G","002_I",...
%              "003_A","003_B","003_C","003_E"];

% mutant_type = "cut7_phospho\1030TD\9A";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% data_list = ["001_A","001_B","001_C","001_D","001_E","001_F",...
%              "002_B","002_C","002_D","002_E",...
%              "003_A","003_B","003_C","003_D","003_E","003_F","003_G","003_H"];

% mutant_type = "cut7_phospho\1030TD\9D";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% data_list = ["001_A","001_B","001_C","001_D","001_E",...
%              "002_A","002_B","002_C","003_A","003_B","003_C",...
%              "004_B","004_C","004_D","004_E","004_F"];

% mutant_type = "cut7_phospho\1030TD\SS";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% data_list = ["001_A","001_B","001_C","001_D","001_E","001_F",...
%              "002_A","002_B","002_C","002_D","002_E","002_F","002_G",...
%              "003_A","003_B","003_C","003_D","003_E","003_F","003_G","003_H","003_I"];

% Plot Line Colors: 
if mutant_type == "cut7_FL\pkl1_klp2_WT"
    LineColor = [0.4, 0.4, 0.4];
end
if mutant_type == "cut7_1032_TD\pkl1_klp2_WT"
    LineColor = [0.0, 0.9, 0.0];
end
if mutant_type == "cut7_1017_TD\pkl1_klp2_WT"
    LineColor = [0.9, 0.5, 0.0];
end
if mutant_type == "cut7_internalD\pkl1_klp2_WT"
    LineColor = [1.0, 0.3, 0.6];
end
if mutant_type == "cut7_FL\pkl1D_klp2D"
    LineColor = [0.4, 0.4, 0.4];
end
if mutant_type == "cut7_1032_TD\pkl1D_klp2D"
    LineColor = [0.0, 0.9, 0.0];
end
if mutant_type == "cut7_1017_TD\pkl1D_klp2D"
    LineColor = [0.9, 0.5, 0.0];
end
if mutant_type == "cut7_1006_TD\pkl1D_klp2D"
    LineColor = [0.3, 0.7, 1.0];
end
if mutant_type == "cut7_988_TD\pkl1D_klp2D"
    LineColor = [0.5, 0.1, 0.8];
end

if mutant_type == "cut7_phospho\FL\SS"
    LineColor = [0.6, 0, 0.2];
end
if mutant_type == "cut7_phospho\FL\9A"
    LineColor = [0, 0.4, 0.7];
end
if mutant_type == "cut7_phospho\FL\9D"
    LineColor = [0.8, 0.5, 0];
end
if mutant_type == "cut7_phospho\1030TD\SS"
    LineColor = [1, 0.6, 0.7];
end
if mutant_type == "cut7_phospho\1030TD\9A"
    LineColor = [0.5, 0.8, 1];
end
if mutant_type == "cut7_phospho\1030TD\9D"
    LineColor = [1, 0.8, 0.4];
end

% Initialize a signle GRAND matrix to save all mutants length vs. ratio
GRAND_length_v_ratio = zeros(0,2);

for idx = 1 : length(data_list)

    cd (data_path + data_list(idx));
    % This is the path to cut7_pos_peak.mat and the regional data
    load pos_cut7_pk.mat;
    load midzone_region.mat;
    load pole1_region.mat;
    load pole2_region.mat;

    % First non-zero element in pos_cut7_pk.mat, use it as the first frame for the kymograph
    first_frame = (3 + find(pos_cut7_pk~=[0 0; 0,0], 1, 'first'))/4;
    last_frame = size(pos_cut7_pk, 3);
    
    pole1_intensity = zeros(last_frame, 1);
    pole2_intensity = zeros(last_frame, 1);
    midzone_intensity = zeros(last_frame, 1);
    length_v_ratio = zeros(last_frame,2);
    
    for frame_number = first_frame : last_frame
        pole1_intensity(frame_number) = sum(pole1_region(:,:,:,frame_number), "all", "omitnan");
        pole2_intensity(frame_number) = sum(pole2_region(:,:,:,frame_number), "all", "omitnan");
        midzone_intensity(frame_number) = sum(midzone_region(:,:,:,frame_number), "all", "omitnan");
    end
    
    % Store the mid/pole ratio vs. spindle length in a seperate N-by-2
    % matrix, with 1st col being spindle length, 2nd col being ratio
    mid_pole_ratio = midzone_intensity./(pole1_intensity + pole2_intensity);
    length_v_ratio(:, 1) = 0.1067*sqrt((pos_cut7_pk(2,1,:)-pos_cut7_pk(1,1,:)).^2 + (pos_cut7_pk(2,2,:)-pos_cut7_pk(1,2,:)).^2);
    length_v_ratio(:, 2) = mid_pole_ratio;
    
    % save the results to folder:
    save('pole1_intensity.mat', 'pole1_intensity');
    save('pole2_intensity.mat', 'pole2_intensity');
    save('midzone_intensity.mat', 'midzone_intensity');
    save('mid_pole_ratio.mat', 'mid_pole_ratio');
    save('length_v_ratio.mat', 'length_v_ratio');

    GRAND_length_v_ratio = vertcat(GRAND_length_v_ratio, length_v_ratio);

    % Regional intensity plot: 
    figure;
    plot(pole1_intensity, 'r-', "LineWidth", 2);
    hold on;
    plot(pole2_intensity, 'b-', "LineWidth", 2);
    plot(midzone_intensity, "LineWidth", 2, "Color", [0.85, 0.75, 0]);
    legend("pole1 intensity", "pole2 intensity", "midzone intensity","Location","best");
    legend box off;
    set(gca, "FontName", "Arial", "FontSize", 18, "FontWeight", "bold");
    xlabel("Frame number");
    ylabel("Cut7 intensity (a.u.)");
    hold off;
    out_filename = "pole12_midzone_" + data_list(idx) + ".png";
    exportgraphics(gcf, out_filename);
    cd ..;
    exportgraphics(gcf, out_filename);
    cd (data_path + data_list(idx));
    
    % Ratio plot:
    figure;
    plot(mid_pole_ratio, "LineWidth", 2, 'Color', LineColor);
    hold on;
    set(gca, "FontName", "Arial", "FontSize", 18, "FontWeight", "bold");
    xlabel("Frame number");
    ylabel("Cut7 midzone pole ratio");
    hold off;
    out_filename = "mid_pole_ratio" + data_list(idx) + ".png";
    exportgraphics(gcf, out_filename);
    cd ..;
    exportgraphics(gcf, out_filename);
    cd (data_path + data_list(idx));

    pause(0.1);
    close all;

end

% This is the ratio vs length data for the entire mutant!
cd (data_path)
% Grand Canonical Ensemble?? Haha 
save('GRAND_length_v_ratio.mat', 'GRAND_length_v_ratio');
% It counts every individual cells for the given mutant type. 

cd 'C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\';










