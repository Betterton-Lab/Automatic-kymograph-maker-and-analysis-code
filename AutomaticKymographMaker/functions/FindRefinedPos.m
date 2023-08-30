function pos_cut7_pk = FindRefinedPos(movie4D, pos_cut7_pk_rough, first_frame, last_frame)  
    
    pos_cut7_pk = zeros(2,2,(last_frame-first_frame+1));
    
    % Remove Singular NaN values from pos_cut7_pk_rough (TBD)
   
    % %     movie_path = './cut7_refined_pos.mp4';
    % %     vidfile = VideoWriter(movie_path,'MPEG-4');
    % %     vidfile.FrameRate = 10;
    % %     open(vidfile);
    % %     fff = figure;
    for frame_number = first_frame:last_frame
        img = movie4D(:,:,:,frame_number);
        img_smoothed = imgaussfilt3(img);
        img_MIP = max(img_smoothed, [], 3);
        img_MIP( img_MIP == 0 ) = NaN;
        img_MIP( isnan(img_MIP) ) = 0;
        % Get the rough position of cut7
        pos_rough_x1 = pos_cut7_pk_rough(1,1,frame_number);
        pos_rough_y1 = pos_cut7_pk_rough(1,2,frame_number);
        pos_rough_x2 = pos_cut7_pk_rough(2,1,frame_number);
        pos_rough_y2 = pos_cut7_pk_rough(2,2,frame_number);
        % Fit with Gaussian2D Function and find the refined position
        [pos_ref_x1, pos_ref_y1] = fit2DGaussian(img_MIP, pos_rough_x1, pos_rough_y1, 2);
        [pos_ref_x2, pos_ref_y2] = fit2DGaussian(img_MIP, pos_rough_x2, pos_rough_y2, 2);
        pos_cut7_pk(1,1,frame_number) = pos_ref_x1;
        pos_cut7_pk(1,2,frame_number) = pos_ref_y1;
        pos_cut7_pk(2,1,frame_number) = pos_ref_x2;
        pos_cut7_pk(2,2,frame_number) = pos_ref_y2;
        
        % %         % Display Detection
        % %         imagesc(img_MIP);
        % %         hold on;
        % %         plot(pos_cut7_pk(1,1,frame_number),pos_cut7_pk(1,2,frame_number), 'ro');
        % %         plot(pos_cut7_pk(2,1,frame_number),pos_cut7_pk(2,2,frame_number), 'bo');
        % %         hold off;
        % %         title(sprintf('Frame = %.0f',frame_number));
        % %         writeVideo(vidfile, getframe(gcf));
    end
    % %     close(vidfile);
    % %     close(fff);

    %% Prevent Swapping of Cut7 Spot 7-6-2022
    
% % % %     The strategy: 
% % % %     Check the distance of between the same spot frame to frame
% % % %     Identical spot should be close (frame to frame)
% % % %     If a swap has occured, the frame to frame distance will be huge! 
% % % %     In such case, swap spot index
    for frame_number = 1 : (size(pos_cut7_pk,3)-1)
        spot1_pos_current = pos_cut7_pk(1, :, frame_number);
        spot2_pos_current = pos_cut7_pk(2, :, frame_number);
        spot1_pos_next = pos_cut7_pk(1, :, frame_number+1);
        spot2_pos_next = pos_cut7_pk(2, :, frame_number+1);
        % %     Spot x to Spot x distance between adjacent frames
        spot11_dis = norm(spot1_pos_next - spot1_pos_current);
        %  spot22_dis = norm(spot2_pos_next - spot2_pos_current);
        % %     Spot x to Spot y distance in current frame
        spot12_dis = norm(spot1_pos_next - spot2_pos_current);
        %  spot21_dis = norm(spot2_pos_next - spot1_pos_current);
        if (spot12_dis >= spot11_dis)
            continue;           % This is what things should be!
        else                    % swap spot position for the next frame
            pos_cut7_pk(1, :, frame_number+1) = spot2_pos_next;
            pos_cut7_pk(2, :, frame_number+1) = spot1_pos_next;
        end
    end

    save('pos_cut7_pk.mat','pos_cut7_pk');

end 