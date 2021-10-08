function  percent = calc_change(I_ref, I_aligned)
%% [percent] = calc_change(I_ref, I_aligned)
% I_ref: Reference image ;
% I_aligned: Comparison image (aligned according to reference image);
%
% percent: The percentage of the different pixel points in the overall image (ref image size);

% Remove black borders
[x_min, x_max, y_min, y_max] = cutborder_index(rgb2gray(I_aligned),3);
I_ref = imcrop(I_ref,[x_min, y_min, x_max-x_min, y_max-y_min]);
I_aligned = imcrop(I_aligned,[x_min, y_min, x_max-x_min, y_max-y_min]);

% calculate change map 
ssimMap = ssim_map(I_ref,I_aligned,0.4);
ssimMap2 = bwareaopen(ssimMap,60);

% calculate the percentage of the different pixel points (Imprecise)  
percent =  length(find(ssimMap2==1))/numel(ssimMap2);

%figure,imshow(ssimMap)
end

