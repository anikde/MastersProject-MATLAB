clear all
lung = imread("Covid19Pos-LungCT_2.png");
gray = rgb2gray(lung);
figure(1)
imshow(BW)
figure(2)
imshow(maskedImage)