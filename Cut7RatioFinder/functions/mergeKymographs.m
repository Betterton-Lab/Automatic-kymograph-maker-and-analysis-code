%% This function merges two kymographs into a Red-Green composit and display them in pair
% Last Modified: l0-10-2022


function mergeKymographs(Kymograph1, Kymograph2)
        
        Kymographs_sidebyside = imfuse(Kymograph1, Kymograph2, 'montage', 'Scaling','independent'); 
        Kymographs_sidebyside = imresize(Kymographs_sidebyside, 1);
        figure;
        imshow(Kymographs_sidebyside);
        exportgraphics(gcf,'Paried-Kymograph.png');
        saveas(gcf,'Paried-Kymograph.fig');
        exportgraphics(gcf,'Paried-Kymograph.tif');

        Kymograph_colored_merge = imfuse(Kymograph1, Kymograph2, 'falsecolor', 'Scaling','independent', 'ColorChannels', [1 2 0]);
        Kymograph_colored_merge = imresize(Kymograph_colored_merge, 1);
        figure;
        imshow(Kymograph_colored_merge);
        exportgraphics(gcf,'Red-Green-Kymograph.png');
        saveas(gcf,'Red-Green-Kymograph.fig');
        exportgraphics(gcf,'Red-Green-Kymograph.tif');

end