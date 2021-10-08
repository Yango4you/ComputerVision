clear;clc
close all
im1=imread('...');
im2=imread('...');
tic;
%You can try changing the threshold of ssim and the blocksize of pca+kmean
change_map = ssim_map(im2,im1,0.2);
% change_map = pca_kmeans(im1,im2,5,0.9);
toc;


imshow(change_map);