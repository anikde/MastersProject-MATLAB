function adjusted_images = adjustIntesity(images)
    for i = 1:length(images)
        gray_image = rgb2gray(images{i});
        adjusted_images{i} = imadjust(gray_image);
end