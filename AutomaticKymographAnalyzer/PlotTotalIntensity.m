% % % % Load the persudo kymograph data: 
mutant_type = ["cut7_FL\pkl1_klp2_WT", "cut7_1032_TD\pkl1_klp2_WT", "cut7_1017_TD\pkl1_klp2_WT", "cut7_internalD\pkl1_klp2_WT"];
avg_path = "C:\Research\Softwares\Kymograph Analysis Tools\Saved Data\" + mutant_type + "\Stripe_Collection_Avg_All.mat"; 
err_path = "C:\Research\Softwares\Kymograph Analysis Tools\Saved Data\" + mutant_type + "\Stripe_Collection_Err_All.mat";

% mutant_type = ["cut7_phospho\FL\SS","cut7_phospho\FL\9A","cut7_phospho\FL\9D", "cut7_phospho\1030TD\SS", "cut7_phospho\1030TD\9A", "cut7_phospho\1030TD\9D", "cut7_FL\pkl1_klp2_WT"];
% avg_path = "C:\Research\Softwares\Kymograph Analysis Tools\Saved Data\" + mutant_type + "\Stripe_Collection_Avg_All.mat"; 
% err_path = "C:\Research\Softwares\Kymograph Analysis Tools\Saved Data\" + mutant_type + "\Stripe_Collection_Err_All.mat";

% mutant_type = ["cut7_FL\pkl1D_klp2D", "cut7_1032_TD\pkl1D_klp2D", "cut7_1017_TD\pkl1D_klp2D", "cut7_1006_TD\pkl1D_klp2D", "cut7_988_TD\pkl1D_klp2D"];
% avg_path = "C:\Research\Softwares\Kymograph Analysis Tools\Saved Data\" + mutant_type + "\Stripe_Collection_Avg_All.mat"; 
% err_path = "C:\Research\Softwares\Kymograph Analysis Tools\Saved Data\" + mutant_type + "\Stripe_Collection_Err_All.mat";

% %% Phospho mutants in Kin14 WT
% load(avg_path(1))
% load(err_path(1))
% Average_collection_FLSS = Average_collection; 
% Error_collection_FLSS = Error_collection;
% clear Average_collection; 
% clear Error_collection; 
% load(avg_path(2))
% load(err_path(2))
% Average_collection_FL9A = Average_collection; 
% Error_collection_FL9A = Error_collection;
% clear Average_collection; 
% clear Error_collection; 
% load(avg_path(3))
% load(err_path(3))
% Average_collection_FL9D = Average_collection;
% Error_collection_FL9D = Error_collection;
% clear Average_collection; 
% clear Error_collection; 
% load(avg_path(4))
% load(err_path(4))
% Average_collection_1030TDSS = Average_collection; 
% Error_collection_1030TDSS = Error_collection; 
% clear Average_collection; 
% clear Error_collection; 
% load(avg_path(5))
% load(err_path(5))
% Average_collection_1030TD9A = Average_collection; 
% Error_collection_1030TD9A = Error_collection; 
% clear Average_collection; 
% clear Error_collection; 
% load(avg_path(6))
% load(err_path(6))
% Average_collection_1030TD9D = Average_collection; 
% Error_collection_1030TD9D = Error_collection; 
% clear Average_collection; 
% clear Error_collection; 
% load(avg_path(7))
% load(err_path(7))
% Average_collection_FLWT = Average_collection; 
% Error_collection_FLWT = Error_collection;
% clear Average_collection; 
% clear Error_collection; 

% Truncation mutants in Kin14 WT
load(avg_path(1))
load(err_path(1))
Average_collection_FLWT = Average_collection; 
Error_collection_FLWT = Error_collection;
load(avg_path(2))
load(err_path(2))
Average_collection_1032WT = Average_collection; 
Error_collection_1032WT = Error_collection;
load(avg_path(3))
load(err_path(3))
Average_collection_1017WT = Average_collection; 
Error_collection_1017WT = Error_collection;
load(avg_path(4))
load(err_path(4))
Average_collection_intD = Average_collection; 
Error_collection_intD = Error_collection;

%% Truncation mutants in Kin14 D
% load(avg_path(1))
% load(err_path(1))
% Average_collection_FLD = Average_collection; 
% Error_collection_FLD = Error_collection;
% load(avg_path(2))
% load(err_path(2))
% Average_collection_1032D = Average_collection; 
% Error_collection_1032D = Error_collection;
% load(avg_path(3))
% load(err_path(3))
% Average_collection_1017D = Average_collection; 
% Error_collection_1017D = Error_collection;
% load(avg_path(4))
% load(err_path(4))
% Average_collection_1006D = Average_collection; 
% Error_collection_1006D = Error_collection;
% load(avg_path(5))
% load(err_path(5))
% Average_collection_988D = Average_collection; 
% Error_collection_988D = Error_collection;


% Array to store datas
total_cut7_ea_len_FLWT = zeros(10, 1);
total_cut7_ea_len_1032WT = zeros(10, 1);
total_cut7_ea_len_1017WT = zeros(10, 1);
total_cut7_ea_len_intD = zeros(10, 1);

total_cut7_ea_len_FLD = zeros(10, 1);
total_cut7_ea_len_1032D = zeros(10, 1);
total_cut7_ea_len_1017D = zeros(10, 1);
total_cut7_ea_len_1006D = zeros(10, 1);
total_cut7_ea_len_988D = zeros(10, 1);

total_cut7_ea_len_FLSS = zeros(10, 1);
total_cut7_ea_len_FL9A = zeros(10, 1);
total_cut7_ea_len_FL9D = zeros(10, 1);
total_cut7_ea_len_1030TDSS = zeros(10, 1);
total_cut7_ea_len_1030TD9A = zeros(10, 1);
total_cut7_ea_len_1030TD9D = zeros(10, 1);

for num_lines = 1:10

    total_cut7_ea_len_FLWT(num_lines) = sum(Average_collection_FLWT(num_lines, 1:(10*num_lines+20)));
    total_cut7_ea_len_1032WT(num_lines) = sum(Average_collection_1032WT(num_lines, 1:(10*num_lines+20)));
    total_cut7_ea_len_1017WT(num_lines) = sum(Average_collection_1017WT(num_lines, 1:(10*num_lines+20)));
    total_cut7_ea_len_intD(num_lines) = sum(Average_collection_intD(num_lines, 1:(10*num_lines+20)));
    
%         total_cut7_ea_len_FLD(num_lines) = sum(Average_collection_FLD(num_lines, 1:(10*num_lines+20)));
%         total_cut7_ea_len_1032D(num_lines) = sum(Average_collection_1032D(num_lines, 1:(10*num_lines+20)));
%         total_cut7_ea_len_1017D(num_lines) = sum(Average_collection_1017D(num_lines, 1:(10*num_lines+20)));
%         total_cut7_ea_len_1006D(num_lines) = sum(Average_collection_1006D(num_lines, 1:(10*num_lines+20)));
%         total_cut7_ea_len_988D(num_lines) = sum(Average_collection_988D(num_lines, 1:(10*num_lines+20)));

%         total_cut7_ea_len_FLSS(num_lines) = sum(Average_collection_FLSS(num_lines, 1:(10*num_lines+20)));
%         total_cut7_ea_len_FL9A(num_lines) = sum(Average_collection_FL9A(num_lines, 1:(10*num_lines+20)));
%         total_cut7_ea_len_FL9D(num_lines) = sum(Average_collection_FL9D(num_lines, 1:(10*num_lines+20)));
%         total_cut7_ea_len_1030TDSS(num_lines) = sum(Average_collection_1030TDSS(num_lines, 1:(10*num_lines+20)));
%         total_cut7_ea_len_1030TD9A(num_lines) = sum(Average_collection_1030TD9A(num_lines, 1:(10*num_lines+20)));
%         total_cut7_ea_len_1030TD9D(num_lines) = sum(Average_collection_1030TD9D(num_lines, 1:(10*num_lines+20)));
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

% % Plot all mutants curve:
figure;
axis([0 11 0 25000]);
xticks(1:10);
hold on;
% errorbar((1:length(total_cut7_ea_len_FLD)), total_cut7_ea_len_FLD, Error_collection_FLD(1:10), '.-', 'MarkerSize',20, 'LineWidth', 1, 'Color',color_line_FL);
% errorbar((1:length(total_cut7_ea_len_1032D)), total_cut7_ea_len_1032D, Error_collection_1032D(1:10), '.-', 'MarkerSize',20, 'LineWidth', 1, 'Color',color_line_1032);
% errorbar((1:length(total_cut7_ea_len_1017D)), total_cut7_ea_len_1017D, Error_collection_1017D(1:10), '.-', 'MarkerSize',20, 'LineWidth', 1, 'Color',color_line_1017);
% errorbar((1:length(total_cut7_ea_len_1006D)), total_cut7_ea_len_1006D, Error_collection_1006D(1:10), '.-', 'MarkerSize',20, 'LineWidth', 1, 'Color',color_line_1006);
% errorbar((1:length(total_cut7_ea_len_988D)), total_cut7_ea_len_988D, Error_collection_988D(1:10),'.-', 'MarkerSize',20, 'LineWidth', 1, 'Color',color_line_988);

errorbar((1:length(total_cut7_ea_len_FLWT)), total_cut7_ea_len_FLWT, Error_collection_FLWT(1:10), '.-', 'MarkerSize',20, 'LineWidth',1, 'Color',color_line_FL);
errorbar((1:length(total_cut7_ea_len_1032WT)), total_cut7_ea_len_1032WT, Error_collection_1032WT(1:10), '.-', 'MarkerSize',20, 'LineWidth',1, 'Color',color_line_1032);
errorbar((1:length(total_cut7_ea_len_1017WT)), total_cut7_ea_len_1017WT, Error_collection_1017WT(1:10), '.-', 'MarkerSize',20, 'LineWidth',1, 'Color',color_line_1017);
errorbar((1:length(total_cut7_ea_len_intD)), total_cut7_ea_len_intD, Error_collection_intD(1:10), '.-', 'MarkerSize',20, 'LineWidth',1, 'Color',color_line_intD);

% errorbar((1:length(total_cut7_ea_len_FLSS)), total_cut7_ea_len_FLSS, Error_collection_FLSS(1:10), '.-', 'MarkerSize',20, 'LineWidth',1, 'Color',color_phospho_FL);
% errorbar((1:length(total_cut7_ea_len_FL9A)), total_cut7_ea_len_FL9A, Error_collection_FL9A(1:10), '.-', 'MarkerSize',20, 'LineWidth',1, 'Color',color_phospho_9A);
% errorbar((1:length(total_cut7_ea_len_FL9D)), total_cut7_ea_len_FL9D, Error_collection_FL9D(1:10), '.-', 'MarkerSize',20, 'LineWidth',1, 'Color',color_phospho_9D);
% errorbar((1:length(total_cut7_ea_len_1030TDSS)), total_cut7_ea_len_1030TDSS, Error_collection_1030TDSS(1:10), '.-', 'MarkerSize',20, 'LineWidth',1, 'Color',color_phospho_1030_SS);
% errorbar((1:length(total_cut7_ea_len_1030TD9A)), total_cut7_ea_len_1030TD9A, Error_collection_1030TD9A(1:10), '.-', 'MarkerSize',20, 'LineWidth',1, 'Color',color_phospho_1030_9A);
% errorbar((1:length(total_cut7_ea_len_1030TD9D)), total_cut7_ea_len_1030TD9D, Error_collection_1030TD9D(1:10), '.-', 'MarkerSize',20, 'LineWidth',1, 'Color',color_phospho_1030_9D);

lgd = legend('FL','1-1032','1-1017','989-1028\Delta','Location','northeast','NumColumns',2,'FontSize',18,'FontName','Arial');
% lgd = legend('FL','1-1032','1-1017','1-1006','1-988','Location','northeast','NumColumns', 2);
% legend('Cut7-GFP, Kin14-WT', 'Cut7-1006-GFP, Kin14-D', 'Cut7-988-GFP, Kin14-D', 'Location','northeast');
% legend('FL', '9A', '9D', '1-1030', '1-1030-9A', '1-1030-9D', 'NumColumns',2, 'Location','north','FontName','Arial','FontSize',21);
legend boxoff;
box on;
set(gca, "FontName", "Arial", "FontSize", 21, "Units", "centimeters", "Position", [2.2, 2.0, 15.3, 12]);
set(gcf, "Units", "centimeters", "Position", [14, 10, 17.7, 15])
xtickangle(0);
xlabel('Spindle length (\mum)','FontName','Arial','FontSize',21);
ylabel('Total cut7 intensity (a.u.)','FontName','Arial','FontSize',21);
hold off;
out_filename = "Total Cut7.png";
saveas(gcf, out_filename);
