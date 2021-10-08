function [changeIndex, changeMap, I_aligned] = align_2images_changemap(I_ref, I, threshold, pixelgroup)
%% [changeIndex, changeMap, I_aligned] = align_2images_changemap(I_ref, I, threshold, pixelgroup)
% I_ref: Reference image ;
% I: Comparison image (aligned according to reference image);
% threshold: ssim value, range [0,1].  Where 1 means the same and 0 means totally different.
% pixelgroup: The smallest size is recognized as a different set of pixels;
%
% changeIndex: Coordinate [x, y] of different points, size();
% changeMap: Binary map of different areas of the image;
% I_aligned: aligned image. 



% Cover Google Logo
I_ref= google_delete(I_ref);
I= google_delete(I);

% image registration
I_aligned=alignment(I_ref,I);

% Remove black borders
[x_min, x_max, y_min, y_max] = cutborder_index(rgb2gray(I_aligned),3);
I_ref = imcrop(I_ref,[x_min, y_min, x_max-x_min, y_max-y_min]);
I_aligned = imcrop(I_aligned,[x_min, y_min, x_max-x_min, y_max-y_min]);

ssimMap = ssim_map(I_ref,I_aligned, threshold); % you can also set a threshold
changeMap = bwareaopen(ssimMap,pixelgroup); % Remove small sets of pixels

% Find the coordinates of the different-points
 [row, col]= find(ssimMap~=0); 
 changeIndex = [col, row];
 end

