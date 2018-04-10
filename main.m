%-----------------------------------------------------
%@author - Deval Shah
%Topic - Eigenfaces for Face Recognition in matlab
%Date - 5/3/2017
%Subject - Machine Learning
%-----------------------------------------------------

%Changing directory for reading images from IMAGE_DB\ folder
cd 'C:\\Users\\Deval\\Desktop\\Face Recognition\\IMAGE_DB\'

%Read Files fn reads jpg images from folder.
images = readFiles();

%Changing directory to code folder to run all fns
cd 'C:\Users\Deval\Desktop\Face Recognition\Code\'

error_plot = zeros(1,30);

%Selecting 1 to 30 eigenvectors for recognizing the face to plot and find optimal subspace dimensionality
%Optimal subspace dimensionality is a subspace beyond which your face recognition improve very minimally(negligible) or 
%we can say that the minimum no of eigenvectors that represents your eigenfaces basis and detects image accurately.
%Here loop runs 1 to 30 selecting no of eigenvectors to plot and find optimal subspace dimensionality. 
 
for no_of_eigenvectors = 1:1:30
    
	%Face Recognition fn applied on training set of images 
    [u,A,mean_face] = faceRecognition(images,no_of_eigenvectors);
	
	%Flattens the test image matrix into vector
    test_image = flatten_image('test.jpg');
	%Subtracting average face from test image
    test_minus_mean = test_image - mean_face;
	
	%Calculating weights of Training Images
	weights_images =  weights(A,u,1);
    %Calculating weights of Test Images
	weights_test_image = weights(test_minus_mean,u,0);
	
	%Finding no of images in training dataset
    iter = size(weights_images,2);
	
	%Array to store difference in weights between test image and training images to find best match
    err = [];

    for i = 1:iter
        err(i) = norm(weights_test_image - weights_images(:,i));
    end
	
	%Storing min error which is our best match
    [error,image_no] = min(err);
    %Displaying error values as we increase no of eigenvectors
	fprintf('No of eigen components %d --> Error %d --> Image No %d.\n',j,error,image_no);
    error_plot(j) = error;
	%Display image is function to display the image it recognized closest to the person after calculating error
	%display_image(A(:,image_no));
end    


%Plot of error analysis to check after how many eigenvectors the results are more or less the same
%See the plot and find no of eigenvectors for which error decrease very minimally and recognizes face accurately

x = 1:1:30;
figure;
plot(x,error_plot)
title('Error Analysis')
xlabel('No of eigenvectors')
ylabel('Error')


