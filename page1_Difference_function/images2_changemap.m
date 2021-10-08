function [changeIndex, changeMap] = images2_changemap(I_ref, I_aligned, threshold, pixelgroup)
%% [changeIndex, changeMap, I_aligned] = align_2images_changemap(I_ref, I, threshold, pixelgroup)
% I_ref: Reference image ;
% I_aligned: aligned image. 
% threshold: ssim value, range [0,1].  Where 1 means the same and 0 means totally different.
% pixelgroup: The smallest size is recognized as a different set of pixels;
%
% changeIndex: Coordinate [x, y] of different points, size();
% changeMap: Binary map of different areas of the image;



ssimMap = ssim_map(I_ref,I_aligned, threshold); % you can also set a threshold
changeMap = bwareaopen(ssimMap,pixelgroup); % Remove small sets of pixels

% Find the coordinates of the different-points
 [row, col]= find(ssimMap~=0); 
 changeIndex = [col, row];
 end
