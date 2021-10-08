I = imread('1990_12.jpg');
figure;
%imshow(I);
co_o=color_detection_f(I,1);


% ignoriert pixel Gruppen die kleiner als 50 sind
smallestAcceptableArea=50;
newObjectsMask = uint8(bwareaopen(co_o(:,:,3), smallestAcceptableArea));

%berechnen der prozentzahl von z.B wasser
p_water = nnz(newObjectsMask)/ numel(newObjectsMask);


figure;
% erste vilsialisierung

newObjectsMask(:,end)=0;
newObjectsMask(:,1)=0;
newObjectsMask(end,:)=0;
newObjectsMask(1,:)=0;

%Mask visualisation
mask=newObjectsMask;
I_mask(:,:,1)=I(:,:,1).*uint8(not(logical(mask)));
I_mask(:,:,2)=I(:,:,2).*uint8(((mask*254)+1));
I_mask(:,:,3)=I(:,:,3).*uint8(not(logical(mask)));
imshow(I_mask);
