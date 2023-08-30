%% Plot 4 in 1:
cd 'C:\Research\Softwares\Kymographs Maker\Cut7RatioFinder\saved data\';
mutant_list = ["cut7_FL\pkl1_klp2_WT\", "cut7_1032_TD\pkl1_klp2_WT\", "cut7_1017_TD\pkl1_klp2_WT\", "cut7_internalD\pkl1_klp2_WT\"];

% mutant_list = ["cut7_phospho\FL\SS\", "cut7_phospho\FL\9A\", "cut7_phospho\FL\9D\",...
%                "cut7_phospho\1030TD\SS\","cut7_phospho\1030TD\9A\","cut7_phospho\1030TD\9D\"];

% Colors
LineColor=[0.4, 0.4, 0.4;  0.0, 0.9, 0.0;  0.9, 0.5, 0.0;  1.0, 0.3, 0.6];
% LineColor=[0.6, 0, 0.2;  0, 0.4, 0.7;  0.8, 0.5, 0;  1, 0.6, 0.7;  0.5, 0.8, 1;  1, 0.8, 0.4];

% Plot the final averaged curve with errors
figure;
hold on;
xline(0, "--", 'HandleVisibility', 'on');
ylim([0,2.5]);
xlim([-6, 16]);
% set(gca,"FontName", "Arial", "FontSize", 18, "Units", "centimeters", "Position", [2, 1.8, 8.8, 6.6]);
% set(gcf, "Units", "centimeters", "Position", [17, 14, 11.154, 9.26])
set(gca, "FontName", "Arial", "FontSize", 21, "Units", "centimeters", "Position", [2.2, 2.0, 15.3, 12]);
set(gcf, "Units", "centimeters", "Position", [14, 10, 17.7, 15])
xlabel("Time (minutes)",'FontName','Arial','FontSize',21);
ylabel("Cut7 midzone-to-pole ratio",'FontName','Arial','FontSize',21);

for idx = 1 : length(mutant_list)
    filename = strcat(mutant_list(idx), 'time_vs_ratio.mat');
    load(filename);
    errorbar(time_vs_ratio(:,1), time_vs_ratio(:,2), time_vs_ratio(:,3)./sqrt(time_vs_ratio(:, 4)), '.-', 'MarkerSize',20, 'LineWidth',1, 'Color', LineColor(idx,:));
end

% Plot Legend
lgd = legend('anaphase onset','Location','best');
lgd.FontSize = 21;
lgd.FontName = 'Arial';
legend boxoff;
% lgd = legend('FL','1-1032','1-1017','989-1028\Delta','Location','northeast');
% lgd.FontSize = 18;
% lgd.FontName = 'Arial';
% legend boxon;

% lgd = legend('FL','9A','9D','1-1030','1-1030 9A','1-1030 9D','anaphase onset','Location','northeast');
% lgd.FontSize = 18;
% lgd.FontName = 'Arial';
% legend boxoff;

hold off;
box on;
plot_name = "cut7 phospho ratio_vs_time.png";
saveas(gcf, plot_name);

