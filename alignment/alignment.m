function Ir = alignment(original,distorted)
%% Ir = alignment(original,distorted)
% original: Reference image;
% distorted: Distored or rotated image;
% 
%
% Ir: Calibrated image in aligment (based on the reference image);

% Changing both images to gray scale
original_gray = rgb2gray(original);
distorted_gray = rgb2gray(distorted);
% Using SURF to detect and extract the feature points of both images
ptsOriginal  = detectSURFFeatures(original_gray);
ptsDistorted = detectSURFFeatures(distorted_gray);
[featuresOriginal,validPtsOriginal] = extractFeatures(original_gray,ptsOriginal);
[featuresDistorted,validPtsDistorted] = extractFeatures(distorted_gray,ptsDistorted);

% Matching features between the images
index_pairs = matchFeatures(featuresOriginal,featuresDistorted);
matchedPtsOriginal  = validPtsOriginal(index_pairs(:,1));
matchedPtsDistorted = validPtsDistorted(index_pairs(:,2));

% Estimating the transformation matrix
[tform,~] = estimateGeometricTransform2D(matchedPtsDistorted,matchedPtsOriginal,'similarity');

% Using the estimated transformation to recover
outputView = imref2d(size(original_gray));

% Applying the transformation to the distorted image
Ir = imwarp(distorted,tform,'OutputView',outputView);


%% Check the output image
%blend_im = imfuse(Ir,original,'blend','Scaling','joint');
%figure,imshow(blend_im);

%[registered2, Rregistered] = imwarp(distorted,tform,'FillValues', 255);
%figure, imshowpair(original,outputView,registered2,Rregistered,'blend');
end
