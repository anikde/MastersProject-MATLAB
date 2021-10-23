%% Image Pre-Processing as per the Q-Deformed Entropy paper

image = imread("Covid19Pos-LungCT.png");
figure(1),clf
subplot(221);

imhist(image)
title("pixel values of original image");
subplot(222)
imshow(image);
%image = rgb2gray(image);
% imagesc(image)

%% Histogram Equalisation on original image
histogram_eq = histeq(image);
%imshow(intensity_adjusted)
subplot(223)
imhist(histogram_eq)
subplot(224)
imagesc(histogram_eq)

%% Converting to binary image
% binary = imbinarize(intensity_adjusted);
% imagesc(binary)