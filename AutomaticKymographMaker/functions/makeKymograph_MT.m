function Kymograph = makeKymograph_MT(movie4D, pos_cut7_pk, first_frame, last_frame, time_step)
    
    % Number of steps for interpolation
    interp_step = 100; 
    % If set to 0, interp_step will be set to max spindle pixel length (a variable)
    % else, it will equal to a fixed value (100, 200 etc.)
    use_fixed_interp_step = 0;
    % If set to 1, will use fix center configuration for drawing the alignment axis
    % To use fix end alignment axis, set this to 0
    fix_cntr_alignment = 0;
    
    % ImageData from .nd2 file
    voxel_size = [0.1067, 0.1067, 0.5000];
    % Extra pixel distance added to one end of the cut7 spot pos
    AbsEndExt = 50;
    
    % Extract cut7 peak to peak distance
    cut7pk_vector = squeeze(pos_cut7_pk(1,:,:) - pos_cut7_pk(2,:,:));
    cut7pk_vector_micron = cut7pk_vector .* [voxel_size(1); voxel_size(2)];
    p2p_len_pix = sqrt(sum((cut7pk_vector.^2), 1));             % p2p distance in pixels
    p2p_len_micron = sqrt(sum((cut7pk_vector_micron.^2), 1));   % p2p distance in microns
    max_p2p_len_pix = ceil(max(p2p_len_pix));                   % Max distance in pixels
    max_p2p_len_micron = ceil(max(p2p_len_micron));             % Max distance in microns
    ratio7_to_max = max_p2p_len_micron ./ p2p_len_micron;       % Ratios of individual spindle length to max length
    
    if (use_fixed_interp_step == 0)
        interp_step=max_p2p_len_pix+AbsEndExt;
    end
    
    % Initialize empty matrix to store kymograph & cut7 pos
    Kymograph = zeros( (last_frame - first_frame + 1), interp_step );
    cut7_pk_pos_on_kymograph = zeros( (last_frame - first_frame + 1), 3 );

    % Make a movie demo of alignment and kymograph making
    movie_path = './MT_aligned_movie.mp4';
    vidfile = VideoWriter(movie_path,'MPEG-4');
    vidfile.FrameRate = 10;
    open(vidfile);
    hhh = figure;
    for frame_number = first_frame:last_frame
        img = movie4D(:,:,:,frame_number);
        img_smoothed = imgaussfilt3(img);
        img_MIP = max(img_smoothed, [], 3);
        % Use SPB position for Cut-7 position and extended position
        cut7_pos1 = pos_cut7_pk(1,:,frame_number);
        cut7_pos2 = pos_cut7_pk(2,:,frame_number);
        cut7_pos_cntr = (cut7_pos1 + cut7_pos2) / 2;
        end_pos1= cut7_pos1 - (cut7_pos2-cut7_pos1)/norm(cut7_pos2-cut7_pos1)*AbsEndExt;
        end_pos2= cut7_pos1 + (cut7_pos2-cut7_pos1)*ratio7_to_max(frame_number);
        % % % % Fix Center Configuration % % % %
        if (fix_cntr_alignment == 1)
            end_pos1 = cut7_pos_cntr + (cut7_pos1 - cut7_pos_cntr) * ratio7_to_max(frame_number);
            end_pos2 = cut7_pos_cntr + (cut7_pos2 - cut7_pos_cntr) * ratio7_to_max(frame_number);
        end
        % % % % Fix Center Configuration % % % %
        % Single-line Interoplation: 
        x_list = linspace(end_pos1(1), end_pos2(1), interp_step);
        y_list = linspace(end_pos1(2), end_pos2(2), interp_step);
        % Store the cut7 peak pos relative to end pos
        cut7_pk_pos_on_kymograph(frame_number,1) = norm(cut7_pos1-end_pos1)/norm(end_pos2-end_pos1);
        cut7_pk_pos_on_kymograph(frame_number,2) = norm(cut7_pos2-end_pos1)/norm(end_pos2-end_pos1);
        cut7_pk_pos_on_kymograph(frame_number,3) = norm(end_pos2-end_pos1);
        % Interpolate to get intensity of the pixels alone the line in 2D (MIP) and 3D
        Intensity_Line = interp2(img_MIP, x_list, y_list, 'cubic');
        % Combines the Intensity_ValueAloneLine variable by stacking them
        Kymograph(frame_number, :) = Intensity_Line;
        % Make Movie Demo
        imagesc(img_MIP); colormap('gray');
        hold on; 
        plot(cut7_pos1(1),cut7_pos1(2),"ro",'MarkerSize',5,'LineWidth',1);
        plot(cut7_pos2(1),cut7_pos2(2),"bo",'MarkerSize',5,'LineWidth',1);
        plot(end_pos1(1),end_pos1(2),"rx",'MarkerSize',5,'LineWidth',1);
        plot(end_pos2(1),end_pos2(2),"bx",'MarkerSize',5,'LineWidth',1);
        plot(x_list, y_list, 'y-', LineWidth = 0.4);
        hold off;
        title(sprintf('Frame = %.0f',frame_number));
        writeVideo(vidfile, getframe(gcf))
    end
    close(vidfile);
    close(hhh);
    save('MT_kymographs.mat','Kymograph');

    
    % Plot Kymograph
    figure; 
    imagesc(Kymograph(first_frame:last_frame, :)); colormap gray;
	title('Kymograph of mCh intensity along MT spindle');
	xt = get(gca, 'XTick');                                     % Original 'XTick' Values
    yt = get(gca, 'YTick');                                     % Original 'YTick' Values
    xtlbl = round(xt*max_p2p_len_micron/interp_step, 2);        % New 'XTickLabel' Vector
    ytlbl = round(time_step*yt/60, 2);                          % New 'YTickLabel' Vector
    % ytlbl = round(yt+first_frame-1, 2);                       % New 'YTickLabel' Vector
    set(gca, 'XTick',xt, 'XTickLabel',xtlbl);
    set(gca, 'YTick',yt, 'YTickLabel',ytlbl);
    xlabel('Distance along the spindle axis (\mum)');
	ylabel('Time (Minutes)');
    hold on;
    c = colorbar;
    c.Label.String = 'MT intensity (a.u)';
	% Plot location of SPB1 and SPB2 on top
    times = 1 : (last_frame - first_frame + 1);
	plot(cut7_pk_pos_on_kymograph(first_frame:last_frame, 1)*interp_step, times, 'r.', 'LineWidth',1);
	plot(cut7_pk_pos_on_kymograph(first_frame:last_frame, 2)*interp_step, times, 'b.', 'LineWidth',1);
    legend('peak1 loc', 'peak2 loc');
    hold off;
    saveas(gcf,'MT_kymographs+end_points.png');
    
end
