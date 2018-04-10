%FUNCTION readFiles

%Input -> All images to be used for training 
%Output -> Image Matrix

%The columns are image matrix of individual images that are resized into vector and are stacked as columns of matrix.
%Every image is resized to 500 * 500 for making computations faster
%Change directory to path where your image files are located
%Also if you are using image files other than jpg change extention to png etc.

function [images] = readFiles()
    cd 'C:\\Users\\Deval\\Desktop\\Face Recognition\\IMAGE_DB\'
    imagefiles = dir('C:\Users\Deval\Desktop\Face Recognition\IMAGE_DB\*.jpg');         
    nfiles = length(imagefiles);    
    for ii=1:nfiles
        currentfilename = imagefiles(ii).name;
        currentimage = rgb2gray(imread(currentfilename));
        currentimage  = imresize(double(currentimage),[500 500]);
        [m,n] = size(currentimage);
        images{ii} = reshape(currentimage,[m*n,1]);
    end
end


