function pos_cut7_pk_rough = FindRoughPos(movie4D, threshold, spot_size)
    
    if (nargin == 1 || nargin == 2)
        spot_size = 3;
        threshold = 3;
    end
    
    data_dimension = size(movie4D);
    total_frames = data_dimension(4);
    pos_cut7_pk_rough = zeros(2,2,total_frames);
    
    %% make cut7 detection movies
    movie_path = './cut7_rough_pos.mp4';
    vidfile = VideoWriter(movie_path,'MPEG-4');
    vidfile.FrameRate = 10;
    open(vidfile);
    ccc = figure;
    for frame_number = 1:total_frames
        img = movie4D(:,:,:,frame_number);
        img_smoothed = imgaussfilt3(img);
        img_MIP = max(img_smoothed, [], 3);
        img_MIP( img_MIP == 0 ) = NaN;
        % Use median - stdev relation to find pixel threshold: 
        max_pix_value = max(img_MIP(:));
        med_pix_value = median(img_MIP(:),'omitnan');
        min_pix_value = min(img_MIP(:));
        max_med_diff = max_pix_value - med_pix_value;
        med_min_diff = med_pix_value - min_pix_value;
        low_val_sp = min_pix_value + 0.7 * med_min_diff;
        hig_val_sp = max_pix_value - 0.7 * max_med_diff;
        intensity_threshold = med_pix_value + threshold * std(img_MIP(:),'omitnan');
        % Cut7 spotsize (by eye)
        cut7_spot = pkfnd(img_MIP, intensity_threshold, spot_size);
        
        % Only get the two maximally-distant points
        PD = squareform(pdist(cut7_spot));
        [~,idxMax] = max(PD(:));
        [idx1, idx2] = ind2sub(size(PD), idxMax);
        cut7_spot_pair = cut7_spot([idx1,idx2],:);
        
        % % img_MIP(img_MIP >= intensity_threshold) = 3000;
        % % img_MIP(img_MIP <= intensity_threshold) = 1000;

        % Display Detection
        imagesc(img_MIP); colormap("gray");
        % imshow(img_MIP, [low_val_sp, hig_val_sp]); colormap gray;
        hold on;
        % plot(cut7_spot(:,1),cut7_spot(:,2), 'ro');
        if isempty(cut7_spot)
            continue
        elseif size(cut7_spot,1) == 1
            pos_cut7_pk_rough(1,:,frame_number) = cut7_spot;
            plot(cut7_spot(1,1),cut7_spot(1,2), 'rx');
        else
            pos_cut7_pk_rough(:,:,frame_number) = cut7_spot_pair;
            plot(cut7_spot_pair(1,1),cut7_spot_pair(1,2), 'rx');
            plot(cut7_spot_pair(2,1),cut7_spot_pair(2,2), 'bx');
            plot(cut7_spot(:,1),cut7_spot(:,2), 'yo');
        end
        hold off;
        title(sprintf('Frame = %.0f',frame_number));
        writeVideo(vidfile, getframe(gcf));
    end
    close(vidfile);
    close(ccc);
    % % save('pos_cut7_pk_rough.mat','pos_cut7_pk_rough');

end
