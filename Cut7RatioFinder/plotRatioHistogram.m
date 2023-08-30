%% Plot 4 in 1:
cd 'C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\';
mutant_list = ["cut7_FL\pkl1_klp2_WT\", "cut7_1032_TD\pkl1_klp2_WT\", "cut7_1017_TD\pkl1_klp2_WT\", "cut7_internalD\pkl1_klp2_WT\"];

time_vs_ratio_all = zeros(200, 100);
time_vs_ratio_all(time_vs_ratio_all==0) = NaN;
for idx = 1 : length(mutant_list)
    filename = strcat(mutant_list(idx), 'time_vs_ratio.mat');
    load(filename);
    % Time
    time_vs_ratio_all(1:size(time_vs_ratio, 1), 6*idx-5) = time_vs_ratio(:, 1);
    time_vs_ratio_all(size(time_vs_ratio, 1)+1:2*size(time_vs_ratio, 1), 6*idx-5) = flipud(time_vs_ratio(:, 1));
    % Ratio average
    time_vs_ratio_all(1:size(time_vs_ratio, 1), 6*idx-4) = time_vs_ratio(:, 2);
    % Std of the mean
    time_vs_ratio_all(1:size(time_vs_ratio, 1), 6*idx-3) = time_vs_ratio(:, 3)./sqrt(time_vs_ratio(:, 4));
    % Lower value:
    time_vs_ratio_all(1:size(time_vs_ratio, 1), 6*idx-2) = time_vs_ratio(:, 2) - time_vs_ratio(:, 3)./sqrt(time_vs_ratio(:, 4));
    % Upper value:
    time_vs_ratio_all(1:size(time_vs_ratio, 1), 6*idx-1) = time_vs_ratio(:, 2) + time_vs_ratio(:, 3)./sqrt(time_vs_ratio(:, 4));
    time_vs_ratio_all(size(time_vs_ratio, 1)+1:2*size(time_vs_ratio, 1), 6*idx-1) = flipud(time_vs_ratio_all(1:size(time_vs_ratio, 1), 6*idx-2));
end

figure;
hold on;
set(gca, "FontName", "Arial", "FontSize", 18, "FontWeight", "bold");
xline(0, "--");
ylim([0,3]);
xlabel("Time (minutes)");
ylabel("Cut7 midzone to pole ratio");
fill(time_vs_ratio_all(1:160,1), time_vs_ratio_all(1:160,5), [0.3, 0.3, 0.3], 'FaceAlpha', 0.3, 'EdgeColor', 'None', 'HandleVisibility','off');
fill(time_vs_ratio_all(1:152,7), time_vs_ratio_all(1:152,11), [0.0, 0.9, 0.0], 'FaceAlpha', 0.3, 'EdgeColor', 'None', 'HandleVisibility','off');
fill(time_vs_ratio_all(1:158,13), time_vs_ratio_all(1:158,17), [1.0, 0.6, 0.0], 'FaceAlpha', 0.3, 'EdgeColor', 'None', 'HandleVisibility','off');
fill(time_vs_ratio_all(1:156,19), time_vs_ratio_all(1:156,23), [1.0, 0.3, 0.6], 'FaceAlpha', 0.3, 'EdgeColor', 'None', 'HandleVisibility','off');
plot(time_vs_ratio_all(1:160,1), time_vs_ratio_all(1:160,2), 'Color', [0.3, 0.3, 0.3], 'LineWidth', 2);
plot(time_vs_ratio_all(1:152,7), time_vs_ratio_all(1:152,8), 'Color', [0.0, 0.9, 0.0], 'LineWidth', 2);
plot(time_vs_ratio_all(1:158,13), time_vs_ratio_all(1:158,14), 'Color', [1.0, 0.6, 0.0], 'LineWidth', 2);
plot(time_vs_ratio_all(1:156,19), time_vs_ratio_all(1:156,20), 'Color', [1.0, 0.3, 0.6], 'LineWidth', 2);
hold off;
out_filename = "anaphase_cut7_ratio_prelin.png";
exportgraphics(gcf, out_filename);


%% The code below plot the histogram of intensity ratio
all_ratio_value = zeros(4,25);
all_ratio_value(all_ratio_value == 0)=NaN;
% Col 24 = Mean, Col 25 = STDEV
for idx = 1:length(mutant_list)
    filename = strcat(mutant_list(idx), 'anaphase_midpole_ratio.mat');
    load(filename);
    all_ratio_value(idx, 1:length(anaphase_ratio_value)) = anaphase_ratio_value;
    all_ratio_value(idx, 24) = mean(anaphase_ratio_value, "omitnan");
    all_ratio_value(idx, 25) = std(anaphase_ratio_value, "omitnan");
    clear anaphase_ratio_value;
end

save("all _ratio_value.mat", "all_ratio_value");

%% Bar plot with errors: 
figure;
mutant_type = categorical({'FL', '1-1032', '1-1017', '989-1028\Delta'});
mutant_type = reordercats(mutant_type,{'FL', '1-1032', '1-1017', '989-1028\Delta'});
ratio_ave = all_ratio_value(:, 24);
ratio_std = all_ratio_value(:, 25);
bar_plot = bar(mutant_type, ratio_ave);
% Control the bar color:
bar_plot.FaceColor = 'flat';
% % Cai's color-scheme
% bar_plot.CData(1,:) = [0.4, 0.4  0.4];
% bar_plot.CData(2,:) = [0.5, 0.7, 0.2];
% bar_plot.CData(3,:) = [0.9, 0.7, 0.1];
% bar_plot.CData(4,:) = [0.9, 0.3, 0.1];
% % Luke's color-scheme
bar_plot.CData(1,:) = [0.3, 0.3, 0.3];
bar_plot.CData(2,:) = [0.0, 0.9, 0.0];
bar_plot.CData(3,:) = [1.0, 0.6, 0.0];
bar_plot.CData(4,:) = [1.0, 0.3, 0.6];
set(gca, "FontName", "Arial", "FontSize", 20, "FontWeight", "bold");
ylim([0 0.6])
hold on;
% Plot the errorbar:
err_bar = errorbar(ratio_ave, ratio_std);
err_bar.Color = [0 0 0];                            
err_bar.LineStyle = 'none';
err_bar.LineWidth = 1.5;
ylabel('Cut7 ratio at anaphase onset');
hold off;
out_filename = "anaphase_cut7_ratio_ggop.png";
exportgraphics(gcf, out_filename);

cd ..;
