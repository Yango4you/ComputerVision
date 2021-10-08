function [x_min, x_max, y_min, y_max] = cutborder_index(I_raw,r)
%% [x_min, x_max, y_min, y_max] = cutborder_index(I_raw,r)
% I_raw: Original image;
% r: Cropping factor,the larger the value, the more cut parts;
% 
%
% x_min, x_max, y_min, y_max: The coordinates of the four points of the cropped out rectangle 

    % set Cropping factor
    if nargin==1
        r=1;
    end
    

    % Cutting off horizontal black borders
    [~,n] = size(I_raw);
    b = sum(I_raw,2);
    b = b';
    z = find(b>n*r);
    [row_mm,row_nn] = size(z);
    y_min = z(row_mm);
    y_max = z(row_nn);
    
    
    % Cutting off vertical black borders
    [m,~] = size(I_raw);
    c = sum(I_raw);
    z = find(c>m*r);
    [col_mm,col_nn] = size(z);
    x_min = z(col_mm);
    x_max = z(col_nn);

end

