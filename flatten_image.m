%Function flatten_image 

%Input  - Image Matrix of dimension [m,n]
%Output  - Reshaped Image Vector of dimension [m*n,1]

%Using reshape function in matlab to convert image matrix into vector

function [fimage] = flatten_image(filename)
    fimage = imresize(double(rgb2gray(imread(filename))),[500,500]);
    [testm,testn] = size(fimage);
    fimage = reshape(fimage,[testm*testn,1]);
end

