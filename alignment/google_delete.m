function I_back = google_delete(I)
%% I_back = google_delete(I)
% I: Original image with google logo;
% 
%
% I_back: image without google logo; 

% getting the size of original image
[m,n,c]=size(I);
% delete the bottom left corner logo: setting the pixel in this area to 0
I(m-80:m,1:170,:)=0;
% return the image without google logo
I_back = I;
end
