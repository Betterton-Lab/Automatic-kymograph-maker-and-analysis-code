% This code batch calculate the Midzone/Pole ratio
% It utilitz the masked region from step 1 (masked_region.mat)

cd 'C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\';

%% Cut7 Truncation Mutants - Kinesin 14 WT
mutant_type = "cut7_FL\pkl1_klp2_WT";
data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
data_list = ["001_A","001_D","001_E","002_A","003_A","003_B","003_D","004_D"...
             "005_A","005_B","005_E","005_F","005_G","005_J"];
% Anaphase onset frames: 
frame_list = [86, 179, 155, 51, 126, 40, 66, 30, 36, 69, 42, 117, 129, 148];
% Convert frame time to real time in seconds: 
frame_time = [9.1432, 9.1432, 9.1432, 9.0831, 9.0394, 9.0394, 9.0394, 9.1104, 8.598, 8.598, 8.598, 8.598, 8.598, 8.598];

% mutant_type = "cut7_1032_TD\pkl1_klp2_WT";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% data_list = ["001_B","002_B","002_C","003_E","003_F","003_G"];
% frame_list = [63, 35, 30, 45, 44, 21];
% frame_time = [7.1936, 8.9464, 8.9464, 8.9616, 8.9616, 8.9616];

% mutant_type = "cut7_1017_TD\pkl1_klp2_WT";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% data_list = ["001_B","001_C","001_D","003_B","003_F","004_A","004_F","004_H","005_C"];
% frame_list = [51, 30, 42, 45, 34, 48, 138, 37, 30];
% frame_time = [9.0346, 9.0346, 9.0346, 9.0034, 9.0034, 8.984, 8.984, 8.984, 8.4707];

% mutant_type = "cut7_internalD\pkl1_klp2_WT";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% data_list = ["001_D","002_A","002_C","002_F","003_B","003_D"];
% frame_list = [127, 150, 32, 103, 137, 39];
% frame_time = [9.0327, 8.9006, 8.9006, 8.9006, 8.9074, 8.9074];

%% Cut7 Phospho Mutants - Kinesin 14 WT
% mutant_type = "cut7_phospho\FL\9A";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% data_list = ["001_A","001_B","002_A","002_C","002_E","002_G","003_A","003_B","003_F","003_G","003_J"];
% frame_list = [69, 107, 186, 34, 28, 55, 27, 15, 11, 80, 189];
% frame_time = [8.9625, 8.9625, 9.0459, 9.0459, 9.0459, 9.0459, 8.6144, 8.6144, 8.6144, 8.6144, 8.6144];

% mutant_type = "cut7_phospho\FL\9D";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% data_list = ["002_E","002_G","003_B","003_F","003_G","003_H","004_C"];
% frame_list = [26, 57, 93, 95, 39, 120, 14];
% frame_time = [8.0986, 8.0986, 8.4196, 8.4196, 8.4196, 8.4196, 8.4401];

% mutant_type = "cut7_phospho\FL\SS";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% data_list = ["001_A","001_E","001_F","002_B","002_F","002_G","003_A"];
% frame_list = [35, 180, 130, 7, 168, 35, 27];
% frame_time = [8.6082, 8.6082, 8.6082, 8.6674, 8.6674, 8.6674, 8.6008];
% 
% mutant_type = "cut7_phospho\1030TD\9A";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% data_list = ["001_D","001_E","001_F","002_B","002_E","003_B","003_D","003_E","003_F"];
% frame_list = [31, 25, 31, 105, 52, 31, 5, 69, 55];
% frame_time = [11.5011, 11.5011, 11.5011, 11.7683, 11.7683, 11.1058, 11.1058, 11.1058, 11.1058];

% mutant_type = "cut7_phospho\1030TD\9D";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% data_list = ["001_C","001_D","002_B","002_C","003_A","003_C","004_B","004_C"];
% frame_list = [25, 48, 61, 25, 85, 98, 7, 10];
% frame_time = [11.2504, 11.2504, 11.1569, 11.1569, 11.2145, 11.2145, 10.7417, 10.7417];

% mutant_type = "cut7_phospho\1030TD\SS";
% data_path = "C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\" + mutant_type + "\";
% data_list = ["001_A","001_F","002_A","002_D","002_E","002_F","002_G","003_C"];
% frame_list = [10, 21, 43, 16, 131, 53, 47, 20];
% frame_time = [11.0647, 11.0647, 11.2477, 11.2477, 11.2477, 11.2477, 11.2477, 10.8971];


% line colors
if mutant_type == "cut7_FL\pkl1_klp2_WT"
    LineColor = [0.3, 0.3, 0.3];
end
if mutant_type == "cut7_1032_TD\pkl1_klp2_WT"
    LineColor = [0.0, 0.9, 0.0];
end
if mutant_type == "cut7_1017_TD\pkl1_klp2_WT"
    LineColor = [1.0, 0.6, 0.0];
end
if mutant_type == "cut7_internalD\pkl1_klp2_WT"
    LineColor = [1.0, 0.3, 0.6];
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

% ratio values right at anaphase start:
anaphase_ratio_value = zeros(size(data_list));
for idx = 1 : length(data_list)

    cd (data_path + data_list(idx));
    % This is the path to cut7_pos_peak.mat and the regional data
    load mid_pole_ratio.mat;
    % plot midzone/pole ratio vs. time
    figure;
    plot(mid_pole_ratio, "LineWidth", 2, 'Color', LineColor);
    hold on;
    % Plot the time point of anaphase onset:
    xline(frame_list(idx), "--");
    % ratio value right at anaphase:
    anaphase_ratio_value(idx) = mid_pole_ratio(frame_list(idx));
    ylim([0,2.5]);
    set(gca, "FontName", "Arial", "FontSize", 18, "FontWeight", "bold");
    xlabel("Frame number");
    ylabel("Cut7 intensity (a.u.)");
    hold off;
    out_filename = "ratio_time_plot_" + data_list(idx) + ".png";
    exportgraphics(gcf, out_filename);
    cd ..;
    exportgraphics(gcf, out_filename);
    pause(0.01);
    close all;

end

% Save the ratio data to file: 
save("anaphase_midpole_ratio.mat", "anaphase_ratio_value");
writematrix(anaphase_ratio_value, "anaphase_midpole_ratio.xlsx");


%% The code below plot all ratio curves for one mutant in a single plot:
% This matrix saves all data (all of mid_pole_ratio)
mid_pole_ratio_all = zeros(400, 2*length(data_list));
mid_pole_ratio_all(mid_pole_ratio_all == 0) = NaN;
mid_pole_ratio_aligned = zeros(200, 2*length(data_list));
mid_pole_ratio_aligned(mid_pole_ratio_aligned == 0) = NaN;
frames_before_anaphase = -30;
frames_after_anaphase = 100;
% save all ratio data into a single mid_pole_ratio_all
% and plot all lines in one plot:
figure;
hold on;
xline(0, "--");
ylim([0,2.5]);
set(gca, "FontName", "Arial", "FontSize", 18, "FontWeight", "bold");
xlabel("Time (minutes)");
ylabel("Cut7 midzone to pole ratio");
for idx = 1 : length(data_list)
    cd (data_path + data_list(idx));
    load mid_pole_ratio.mat;
    % % % save all data into mid_pole_ratio_all
    mid_pole_ratio_all(101:100+length(mid_pole_ratio), 2*idx) = mid_pole_ratio;
    %     mid_pole_ratio_all(101:100+length(mid_pole_ratio), 2*idx) = smoothdata(mid_pole_ratio,'movmean',7,'includenan');
    % frame times in minutes:
    mid_pole_ratio_all(101:100+length(mid_pole_ratio), 2*idx-1) = ...
        frame_time(idx)/60*((1:length(mid_pole_ratio))-frame_list(idx));
    % plot all lines in one plot
    first_plot_frame = frame_list(idx) + 100 + frames_before_anaphase;
    last_plot_frame = frame_list(idx) + 100 + frames_after_anaphase;
    mid_pole_ratio_aligned(1:1+last_plot_frame-first_plot_frame, 2*idx-1) = mid_pole_ratio_all(first_plot_frame:last_plot_frame, 2*idx-1);
    mid_pole_ratio_aligned(1:1+last_plot_frame-first_plot_frame, 2*idx) = mid_pole_ratio_all(first_plot_frame:last_plot_frame, 2*idx);
    plot(mid_pole_ratio_all(first_plot_frame:last_plot_frame, 2*idx-1), ...
         mid_pole_ratio_all(first_plot_frame:last_plot_frame, 2*idx), "LineWidth", 2);
end
hold off;
plot_name = "aligned_ratio_plot.png";
cd 'C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\';
cd (data_path);
% Save the plot to file:
exportgraphics(gcf, plot_name);
% Save mid_pole_ratio_all to file:
save("mid_pole_ratio_all.mat", "mid_pole_ratio_all");
save("mid_pole_ratio_aligned.mat", "mid_pole_ratio_aligned");


%% The code below will attempt to group all ratio values together when they are in the same time interval, and compute their average and standard error

% Extract the time columns, and the ratio value columns to two equal size array
% All elements in time array will have a one-to-one correspondance to all elements in the ratio array
% Their [row, col] indices will matches perfectly
time_array = mid_pole_ratio_aligned(:, 1:2:2*length(data_list));
ratio_array = mid_pole_ratio_aligned(:, 2:2:2*length(data_list));

% The time interval are aligned by the anaphase starting time at zero
% Any other times are rounded to the nearest 0.25 minutes, or 0.5 minutes
% depending on the value specified by tp_per_min (time points per min)
tp_per_min = 1;     % define how many time points per minute (time resolution)
% Round the time array to nearest fraction of a minute:
time_array_rounded = round(tp_per_min*time_array)/tp_per_min;
min_time = min(time_array_rounded(:));
max_time = max(time_array_rounded(:));
% fraction of a minute to integer time conversion:
min_time_counts = 1;
max_time_counts = round(tp_per_min*(max_time-min_time)+1);
% Initialize the ultimate time vs ratio matrix to store/plot data: 
% Format: 1st col are time values, 2nd col are average ratios, 3rd col are ratio standard errors, 
% 4th col are number of data points, 5th col and beyonds are all raw ratio data points within the time intervals
time_vs_ratio = zeros(max_time_counts, 150);
time_vs_ratio(time_vs_ratio==0) = NaN;
for tsc = min_time_counts : max_time_counts

    time_vs_ratio(tsc, 1) = min_time + (tsc-1)/tp_per_min;
    [idx_row, idx_col] = find( abs(time_array_rounded - (min_time + (tsc-1)/tp_per_min)) <= 0.001);
    for i = 1:length(idx_row)
        time_vs_ratio(tsc, 4+i) = ratio_array(idx_row(i), idx_col(i));
    end
    
    time_vs_ratio(tsc, 2) = mean(time_vs_ratio(tsc, 5:150), 'omitnan');
    time_vs_ratio(tsc, 3) = std(time_vs_ratio(tsc, 5:150), 'omitnan');
    % Count the number of non-NaNs 
    time_vs_ratio(tsc, 4) = nnz(~isnan(time_vs_ratio(tsc, 5:150)));
end

% Save the ultimated averaged ratio matrix to file:
save("time_vs_ratio.mat", "time_vs_ratio");

% Plot the final averaged curve with errors
figure;
errorbar(time_vs_ratio(:,1), time_vs_ratio(:,2), time_vs_ratio(:,3)./sqrt(time_vs_ratio(:, 4)),'.-','MarkerSize',20,'Color', LineColor);
hold on;
xline(0, "--");
ylim([0,2.5]);
set(gca, "FontName", "Arial", "FontSize", 18, "FontWeight", "bold");
xlabel("Time (minutes)");
ylabel("Cut7 midzone to pole ratio");
hold off;
plot_name = "averaged_ratio_plot.png";
exportgraphics(gcf, plot_name);


% Go back to main directory:
cd 'C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\';



