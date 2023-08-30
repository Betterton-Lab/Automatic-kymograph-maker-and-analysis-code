% This code takes in the kymograph, and adjust the constrast of kymograph
% The low_thres controls the lower bound for constrast adjustment, anything below will display as 0 (black). 
% The high_thres controls the upper bound for constrast adjustment, anything above will display as 255 (white). 
% lower bound is defined by lower_bound = min_pix_val + low_thres * mid_min_diff;
% upper bound is defined by upper_bound = median_pix_val + high_thres * max_mid_diff;
% last modified: 7-14-2022

function kymoLookBetter_MT(Kymograph, low_thres, high_thres)

    if (nargin == 1 || nargin == 2)
        low_thres = 0.7;
        high_thres = 0.2;
    end

    min_pix_val = min(Kymograph(:));
    max_pix_val = max(Kymograph(:));
    median_pix_val = median(Kymograph(:), 'omitnan');
    mid_min_diff = median_pix_val - min_pix_val; 
    max_mid_diff = max_pix_val - median_pix_val;

%     % % Special value  :D
%     low_val_sp = min_pix_val + low_thres * mid_min_diff; 
%     hig_val_sp = median_pix_val + high_thres * max_mid_diff;

% %     % Use raw value directly  10-3-2022
    low_val_sp = low_thres; 
    hig_val_sp = high_thres;

    
    %% Solo optimized figure
    figure;
    SmoothedKymograph = imgaussfilt(Kymograph);
    SmoothedKymograph = imresize(SmoothedKymograph, 1);
    imshow(SmoothedKymograph, [low_val_sp, hig_val_sp]); colormap gray;
    saveas(gcf, 'MT_KymographOptimized.png');
    saveas(gcf, 'MT_KymographOptimized.fig');
    saveas(gcf, 'MT_KymographOptimized.tif');
    %% Solo optimized figure

end
