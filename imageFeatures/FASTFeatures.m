image_path = "../covidDataset/COVID/Covid (20).png";
image_files = dir("../covidDataset/COVID/");
nfiles = length(image_files);
% for i = 1:nfiles
%     current_file_name = image_files(i).name;
%     current_image = imread(current_file_name);
%     images{i} = current_image;
% end
figure(1)
image = imread(image_path);
image = rgb2gray(image);
corners = detectFASTFeatures(image, "MinContrast", 0.1);
J = insertMarker(image, corners, 'circle');
subplot(121)
imshow(image);
title("original image");
subplot(122)
imshow(J)
title("Matlab - FAST features");