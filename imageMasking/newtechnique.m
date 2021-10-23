 image = imread("Covid19Pos-LungCT_2.png");
 figure(1)
 imshow(image)
 figure(2)
 imhist(image)
 gray = rgb2gray(image);
 
 imagesize = size(image);
 numRows = imagesize(1);
 numCols = imagesize(2);
 
 wavelengthMin  = 4/sqrt(2);
 wavelengthMax = hypot(numRows, numCols);
 
 n = floor(log2(wavelengthMax / wavelengthMin));
 wavelength = 2.^(0:(n-2)) * wavelengthMin;
 
 deltaTheta = 45;
 orientation = 0:deltaTheta:(180 - deltaTheta);
 
 g = gabor(wavelength, orientation);
 
 gabormag = imgaborfilt(gray, g);
 
 for i = 1:length(g)
     sigma = 0.5 * g(i).Wavelength;
     k = 3;
     gabormag(:, :, i) = imgaussfilt(gabormag(:, :, i), k*sigma);
 end
 
 X = 1:numCols;
 Y = 1:numRows;
 [X, Y] = meshgrid(X, Y);
 featureSet = cat(3, gabormag, X);
 featureSet = cat(3, featureSet, Y);
 
 numPoints = numRows * numCols;
 X = reshape(featureSet, numRows*numCols, []);
 
 X = bsxfun(@minus, X, mean(X));
 X = bsxfun(@rdivide, X, std(X));
 
 coeff = pca(X);
 feature2DImage = reshape(X*coeff(:,1), numRows, numCols);
 figure(3)
 imshow(feature2DImage, [])
 
 L = kmeans(X, 2, 'Replicates', 5);
 L = reshape(L, [numRows numCols]);
 figure(4)
 imshow(label2rgb(L))
 
 Aseg1 = zeros(size(image), 'like', image);
 Aseg2 = zeros(size(image), 'like', image);
 BW = L == 2;
 BW = repmat(BW, [1 1 3]);
 Aseg1(BW) = image(BW);
 Aseg2(~BW) = image(~BW);
 figure(5)
 imshowpair(Aseg1, Aseg2, 'montage');
     
