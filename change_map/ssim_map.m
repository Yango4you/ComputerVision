function [change_map] = ssim_map(im1,im2,threshold)
%% [change_map] = ssim_map(im1,im2,threshold)
% im1: Input image for time 1 with size of [m,n,k];
% im2: Input image for time 2 with size of [m,n,k];
% threshold: Less than this threshold is a different point
%
% change_map: Change map with size of [m,n];



%% calculate the Structural similarity (SSIM) index
if size(im1, 3) == 3
    [ssimval,ssimmap] = ssim(rgb2gray(im2),rgb2gray(im1));
else
    [ssimval,ssimmap] = ssim(im2,im1);
end
    
    
%% set the default threshold;
% The ssim value of ssim lies between 0 and 1, where 1 means the same and 0 means different.
% ssimval is ssim value of the entire image
if nargin <= 2
    threshold = ssimval;
end

%% Set the pixel points below the threshold as change points to get the change map
change_map = zeros(size(ssimmap));
change_point_index = ssimmap <= threshold;
change_map(change_point_index) = 1;
change_map(im2(:,:,1) == 0)=0; % delete black boarder



