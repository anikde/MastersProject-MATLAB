%%Pre-processing as mentioned in Q-Deformed entropy paper

image = imread("Covid19Pos-LungCT.png");

gray = rgb2gray(image);
figure(1),clf
subplot(221)
imshow(gray);
title("original")

adjust = imadjust(gray);
subplot(222)
imshow(adjust);
title({'After adjusting intesity values'; 'Adjust'});


binary = imbinarize(gray);
subplot(223)
imshow(binary);
title("'Binary' image")

imageSize = size(gray);


% for i = 1:imageSize(1)
%     for j = 1:imageSize(2)
%         if adjust(i ,j) < mean2(adjust)
% %             newpicture(i, j) = 0;
%             adjust(i, j) = 0;
%         else
% %             newpicture(i, j) = 255;
%             adjust(i, j) = 255;
%         end
%     end
% end

% subplot(224)
% imshow(adjust)
% title("After pixelmanipulation on adjust")

%removing small objects from binary image
removed_objects = bwareaopen(binary, 400);
figure(2), clf
subplot(221);
imshow(removed_objects);
title("After removing small objects");

%filling holes
filing = imfill(removed_objects, "holes");
subplot(222);
imshow(filing);
title({"after filing regions and holes";"'filling'"});

% newpicture = zeros(imageSize(1), imageSize(2));
% for i = 1:imageSize(1)
%     for j = 1:imageSize(2)
%         newpicture(i, j) = binary(i ,j). * image(i, j);
%     end
% end

newpicture = immultiply(binary, gray);

subplot(223)
imshow(newpicture);
title("After multiplication of binary and gray");

filling_uint8 = im2uint8(filing); %class coversion from logical to uint8


%subtraction to get only lungs
lungs = imsubtract(filling_uint8, newpicture);
subplot(224)
imshow(lungs);
title("subtracted")

figure(3)
subplot(121)
subtraction_with_adjust = imsubtract(filling_uint8, adjust);
imshow(subtraction_with_adjust)
title("Adjust subtracted from filing")

subplot(122)
imshow(lungs)
title("binary*gray subtracted from filing");

adjust_filling = imfill(adjust, "holes");
figure(4),clf
subplot(221)
imshow(adjust_filling)
title("hole filing in adjusted image");

subtracted_from_adjust = imsubtract(adjust_filling, adjust);
subplot(222)
imshow(subtracted_from_adjust);


inverse = uint8(255) - adjust_filling;
subplot(223)
imshow(inverse)

subplot(224)
subtract_from_invert = imsubtract(adjust, inverse);
imshow(subtract_from_invert);


       
        





            