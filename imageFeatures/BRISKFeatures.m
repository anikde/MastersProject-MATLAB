image_path = "../covidDataset/COVID/Covid (10).png";

figure(1)
image = imread(image_path);
image = rgb2gray(image);
size(image)

points = detectBRISKFeatures(image);
imshow(image); hold on;
plot(points.selectStrongest(20));

