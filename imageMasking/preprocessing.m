%%Pre-processing 
clear
image = imread("Covid19Pos-LungCT.png");
figure(1)
subplot(131);
imagesc(image);
title("original")
channelone = rgb2gray(image);
subplot(132);
imagesc(channelone);
title("grayscale");

binary = imbinarize(channelone);
subplot(133)
imagesc(binary);
title("binary");
figure(2)

subplot(121);
imhist(image);
title("histogram plot of original image");
subplot(122);
imhist(binary);
title("histogram plot of binary image");

image_mean = mean2(channelone)
imagesize = size(image);
sizeX = imagesize(1);
sizeY = imagesize(2);

newpicture = zeros(sizeX, sizeY);

for i = 1:sizeX
    for j = 1:sizeY
        if channelone(i, j) < image_mean
            newpicture(i, j) = 0;
        else
            newpicture(i, j) = 255;
        end
    end
end

figure(3), clf
subplot(221)
imagesc(newpicture);

%removing small objects from binary image
binary_without_objects = bwareaopen(newpicture, 50);
subplot(222)
imagesc(binary_without_objects);

%filling regions and holes
filing_holes = imfill(binary_without_objects, "holes");
subplot(223)
imagesc(filing_holes);

%subtracting images
subtracted = imsubtract(binary_without_objects, filing_holes);
subplot(224)
imagesc(subtracted)


figure(4), clf
imagesc(subtracted);

figure(5), clf
more_filling = bwareaopen(subtracted, 100);
more = imfill(more_filling, "holes");
more2 = imfill(more, "holes");
% more = bwareaopen(more_filling, 50);
imagesc(more2);


