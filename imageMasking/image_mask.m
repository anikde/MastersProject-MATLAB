I = imread('Covid19Pos-LungCT.png');
imshow(I)
i2 = rgb2gray(I);
imshow(i2)
i3 = imadjust(i2);
imshow(i3)
i4 = imbinarize(i3);
imshow(i4)
i5 = bwareaopen(i4, 50);
imshow(i5)