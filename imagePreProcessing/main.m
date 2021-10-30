clear
dir_path = "../covidDataset/COVID/";
image_format = "*.png";
images_positive = getImageArray(dir_path, image_format);
number_of_covid_positive_images = size(images_positive, 1);

dir_path = "../covidDataset/non-COVID/";
image_format = "*.png";
images_negative = getImageArray(dir_path, image_format);
number_of_covid_negative_images = size(images_negative, 1);

figure(1)
subplot(221)
imshow(images_negative{100});
title("Original negative");

subplot(222)
imshow(images_positive{100});
title("Original positive");

intensity_adjusted_Cpositive_images = adjustIntensity(images_positive);
intensity_adjusted_Cnegative_images = adjustIntensity(images_negative);

subplot(223)
imshow(intensity_adjusted_Cnegative_images{100});
title("intensity adjusted Cnegative image");

subplot(224)
imshow(intensity_adjusted_Cpositive_images{100});
title("intensity adjusted Cpositive image");