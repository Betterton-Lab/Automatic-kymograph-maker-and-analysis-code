% Find desirable spindle length in GRAND_length_v_ratio and calculate the
% average midzone / pole ratio in the given range. 

% Getting all ratios in between 3 - 7 microns: 
% mutant_type = ["cut7_FL\pkl1D_klp2D\", "cut7_1032_TD\pkl1D_klp2D\", "cut7_1017_TD\pkl1D_klp2D\", "cut7_1006_TD\pkl1D_klp2D\", "cut7_988_TD\pkl1D_klp2D\"];
% file_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "GRAND_length_v_ratio.mat";

mutant_type = ["cut7_FL\pkl1_klp2_WT\", "cut7_1032_TD\pkl1_klp2_WT\", "cut7_1017_TD\pkl1_klp2_WT\", "cut7_internalD\pkl1_klp2_WT\"];
file_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "GRAND_length_v_ratio.mat";

ALL_MUT_RATIO = zeros(5,4);

for idx = 1:length(mutant_type)
    load(file_path(idx));

    % Length range, in microns:
    lo = 4;
    hi = 8;
    
    % Find the row indexs from GRAND matrix s.t. the spindle length are in range:
    row_idx_in_range = find ( GRAND_length_v_ratio(:,1)>=lo & GRAND_length_v_ratio(:,1)<=hi );
    % Extracting the ratios out: 
    ratios_in_range = GRAND_length_v_ratio(row_idx_in_range, 2);
    
    avg_ratio = mean(ratios_in_range);
    err_ratio = std(ratios_in_range);
    mid_ratio = median(ratios_in_range);

    ALL_MUT_RATIO(idx, 1) = avg_ratio;
    ALL_MUT_RATIO(idx, 2) = mid_ratio;
    ALL_MUT_RATIO(idx, 3) = err_ratio;
    ALL_MUT_RATIO(idx, 4) = length(ratios_in_range);

end




