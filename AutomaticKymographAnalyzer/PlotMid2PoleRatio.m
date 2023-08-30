% This code plot pole to midzone cut7-GFP intensity ratio for different cut7 mutants
% This code use the function getRatio.m

% Add path to accessory functions
addpath(genpath('functions'));

% % Cut7 mutant data path:
% mutant_type = ["cut7_FL\pkl1_klp2_WT\", "cut7_1032_TD\pkl1_klp2_WT\", "cut7_1017_TD\pkl1_klp2_WT\", "cut7_internalD\pkl1_klp2_WT\"];
mutant_type = ["cut7_FL\pkl1D_klp2D\", "cut7_1032_TD\pkl1D_klp2D\", "cut7_1017_TD\pkl1D_klp2D\", "cut7_1006_TD\pkl1D_klp2D\", "cut7_988_TD\pkl1D_klp2D\"];
filepath = "C:\Research\Softwares\Kymograph Analysis Tools\Saved Data\" + mutant_type;

% % Cut7 phospho mutants data path:
% mutant_type = ["cut7_phospho\FL\SS\", "cut7_phospho\FL\9A\", "cut7_phospho\FL\9D\", "cut7_phospho\1030TD\SS\", "cut7_phospho\1030TD\9A\", "cut7_phospho\1030TD\9D\"];
% filepath = "C:\Research\Softwares\Kymograph Analysis Tools\Saved Data\" + mutant_type;

% Initialize empty array to store the pole to midzone cut7 ratio and error for each mutant. 
% (e.g. FL-ratio = 1st col, FL-err = 2nd col, 1032-ratio = 3rd col, 1032-err = 4th col ...)
ratio_n_error = zeros(10, 20);

for mutant_idx = 1:length(mutant_type)
    for p2p_dist = 1:10
        filename = filepath(mutant_idx) + "Stripe_Collection_" + p2p_dist+ ".0_microns.mat";
        load(filename);
        [ratio_n_error(p2p_dist, 2*mutant_idx-1), ratio_n_error(p2p_dist, 2*mutant_idx)] ...
            = getRatio(Stripe_Collection, p2p_dist, 3);
    end
end 

% Plot lines colors:
color_line_FL = [0.4, 0.4, 0.4];
color_line_1032 = [0.0, 0.9, 0.0];
color_line_1017 = [0.9, 0.5, 0.0];
color_line_1006 = [0.3, 0.7, 1.0];
color_line_988 = [0.5, 0.1, 0.8];
color_line_intD = [1.0, 0.3, 0.6];

color_phospho_FL = [0.6, 0, 0.2];
color_phospho_9A = [0, 0.4, 0.7];
color_phospho_9D = [0.8, 0.5, 0];
color_phospho_1030_SS = [1, 0.6, 0.7];
color_phospho_1030_9A = [0.5, 0.8, 1];
color_phospho_1030_9D = [1, 0.8, 0.4];

% Plot all the mutants:
figure;
axis([0 11 0 1.6]);
xticks(1:10);
hold on;
errorbar(1:10, ratio_n_error(:, 1), ratio_n_error(:, 2), '.-', 'MarkerSize',20, 'LineWidth', 1, 'Color', color_line_FL);
errorbar(1:10, ratio_n_error(:, 3), ratio_n_error(:, 4), '.-', 'MarkerSize',20, 'LineWidth', 1, 'Color', color_line_1032);
errorbar(1:10, ratio_n_error(:, 5), ratio_n_error(:, 6), '.-', 'MarkerSize',20, 'LineWidth', 1, 'Color', color_line_1017);
% errorbar(1:10, ratio_n_error(:, 7), ratio_n_error(:, 8), '.-', 'MarkerSize',20, 'LineWidth', 1, 'Color', color_line_intD);
errorbar(1:10, ratio_n_error(:, 7), ratio_n_error(:, 8), '.-', 'MarkerSize',20, 'LineWidth', 1, 'Color', color_line_1006);
errorbar(1:10, ratio_n_error(:, 9), ratio_n_error(:, 10), '.-', 'MarkerSize',20, 'LineWidth', 1, 'Color', color_line_988);
% errorbar(1:10, ratio_n_error(:, 1), ratio_n_error(:, 2), '.-', 'MarkerSize',20, 'LineWidth', 1, 'Color', color_phospho_FL);
% errorbar(1:10, ratio_n_error(:, 3), ratio_n_error(:, 4), '.-', 'MarkerSize',20, 'LineWidth', 1, 'Color', color_phospho_9A);
% errorbar(1:10, ratio_n_error(:, 5), ratio_n_error(:, 6), '.-', 'MarkerSize',20, 'LineWidth', 1, 'Color', color_phospho_9D);
% errorbar(1:10, ratio_n_error(:, 7), ratio_n_error(:, 8), '.-', 'MarkerSize',20, 'LineWidth', 1, 'Color', color_phospho_1030_SS);
% errorbar(1:10, ratio_n_error(:, 9), ratio_n_error(:, 10), '.-', 'MarkerSize',20, 'LineWidth', 1, 'Color', color_phospho_1030_9A);
% errorbar(1:10, ratio_n_error(:, 11), ratio_n_error(:, 12), '.-', 'MarkerSize',20, 'LineWidth', 1, 'Color', color_phospho_1030_9D);

% set(gca, "FontName", "Arial", "FontSize", 18, "Units", "centimeters", "Position", [2, 1.8, 8.8, 6.6]); %, "YTickLabel", ""); %, "FontWeight", "bold"
% set(gcf, "Units", "centimeters", "Position", [17, 14, 11.154, 9.26])
% set(gca,"FontName", "Arial", "FontSize", 18, "Units", "centimeters", "Position", [2, 1.8, 12, 9]);
% set(gcf, "Units", "centimeters", "Position", [17, 14, 14.112, 11.193])
% lgd = legend('FL 1-1085','1-1032','1-1017','989-1028\Delta','Location','northeast','NumColumns',1,'FontSize',18,'FontName','Arial');
lgd = legend('FL','1-1032','1-1017','1-1006','1-988','Location','northeast','NumColumns',1,'FontName','Arial','FontSize',18);
set(gca, "FontName", "Arial", "FontSize", 21, "Units", "centimeters", "Position", [2.2, 2.0, 15.3, 12]);
set(gcf, "Units", "centimeters", "Position", [14, 10, 17.7, 15])
% lgd = legend('FL','9A','9D','1-1030','1-1030 9A','1-1030 9D','Location','northwest','NumColumns',1,'FontName','Arial','FontSize',21);
legend boxoff;
box on;
xtickangle(0);
xlabel('Spindle length (\mum)','FontName','Arial','FontSize',21);
ylabel('Cut7 midzone-to-pole ratio','FontName','Arial','FontSize',21);
hold off;
out_filename = "Cut7 midzone-pole ratio.png";
saveas(gcf, out_filename);
