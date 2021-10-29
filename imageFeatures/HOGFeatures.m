image_path = "../covidDataset/COVID/Covid (10).png";

figure(1)
image = imread(image_path);
image = imresize(image, [256 256]);
image = rgb2gray(image);

[featureVector, visualisation] = extractHOGFeatures(image);
subplot(221);
imshow(image);

subplot(222);
resized = imresize(image, [256 256]);
imshow(resized)


subplot(223);
plot(visualisation);

size(featureVector)
size(image)
subplot(224);
imshow(image);
hold on;
plot(visualisation);