function [bounding_stats,bounding_num] = bounding_change(I_ref,I,range)
% [bounding_stats,bounding_num] = bounding_change(I_ref,I)
% I_ref: Reference Image
% I: Comparsion Image
%
% bounding_stats: properties of bounding blocks
% bounding_num: Number of bounding blocks

% Build binary change Maps
img1=rgb2gray(I_ref);
img2=rgb2gray(I);
img1(img2 == 0)=0; 
%img_diff=(img1-img2)+(img2-img1);
img_diff=imabsdiff(img1,img2);
img_threshold=graythresh(img_diff);
img_map=imbinarize(img_diff,img_threshold);

% Filtering small differences
img_map =  bwareaopen(img_map,10);
%figure(1),imshow(img_map);

%Expansion of error points, setting up marker circles
element = strel('sphere', range);                  
dilate  = imdilate(img_map, element);    
bounding_stats = regionprops(logical(dilate));
bounding_num = length(bounding_stats);
end

