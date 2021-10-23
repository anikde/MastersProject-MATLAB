clear
image = imread("Covid19Pos-LungCT_2.png");
gray = rgb2gray(image);
figure(1)
imshow(gray);
grayCol = gray(:);
imageSize = size(grayCol);

[m n] = kmeans(grayCol, 2);

m = reshape(m, size(gray, 1), size(gray, 2));
B = labeloverlay(gray, m);
figure(2)
imshow(B)