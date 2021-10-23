clear all
lung = imread("Covid19Pos-LungCT_2.png");
gray =rgb2gray(lung);
figure(1)
imshow(gray)
% imhist(image)
imageSize = size(gray);
sizeX = imageSize(1);
sizeY =imageSize(2);
mask = zeros(sizeX, sizeY);
for i = 1:sizeX
    for j = 1:sizeY
        if lung(i, j) < 70
            mask(i, j) = 0;
        else
            mask(i, j) = 255;
        end
    end
end
figure(2)
imshow(mask)

%%applying mask
maskedImage = bsxfun(@times, mask, cast(lung, 'like',  mask));
figure(3)
imshow(maskedImage)

subtracted = imsubtract(im2uint8(mask), gray);
figure(4)
imshow(subtracted)
