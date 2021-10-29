clear;
% A Gentle Introduction Into The Histogram Of Oriented Gradients https://medium.com/analytics-vidhya/a-gentle-introduction-into-the-histogram-of-oriented-gradients-fdee9ed8f2aa
image_path = "../covidDataset/COVID/Covid (20).png";

figure(1)
image = imread(image_path);
image = imresize(image, [256 128]);
image = rgb2gray(image);
image = im2double(image);
imshow(image)
rows = size(image, 1);
cols = size(image, 2);

mag = double.empty();
theta = double.empty();

for r = 1:rows
    magnitudeArray = double.empty();
    angleArray = double.empty();
    for c = 1:cols
        % Condition for axis 0 
        if c-1 <= 0 || c+1 >= cols
            if c-1 <= 0
                Gx = image(r, c+1) - 0;
            elseif c+1 >= cols
                Gx = 0 - image(r, c-1);
            end
        else
            Gx = image(r, c+1) - image(r, c-1);
        end
        % Condition for axis 1
        if r-1 <= 0 || r+1 >= rows
            if r-1 <= 0
                Gy = 0 - image(r+1, c);
            elseif r+1 >= rows
                Gy = image(r-1, c) - 0;
            end
        else
            Gy = image(r-1, c) - image(r+1, c);
        end
        %calculateing gradient
        magnitude = sqrt(power(Gx, 2) + power(Gy, 2));
%         magnitudeArray = append(round(magnitude, 9));
        magnitudeArray = [magnitudeArray, round(magnitude, 9)];
        
        %calculating angle
        if Gx == 0
            angle = 0;
        else
            angle = abs(atand(Gy / Gx));
        end
        angleArray = [angleArray, round(angle, 9)];
    end
    mag = [mag; magnitudeArray];
    theta = [theta; angleArray];
end

figure(2);

subplot(121);
imshow(mag);
title("Magnitudes")

subplot(122);
imshow(theta)            
title("Angles")

global number_of_bins
number_of_bins = 9;
global step_size
step_size = 180 /number_of_bins;

histogram_points_nine = double.empty();
for r = 1:rows:8
    temp = double.empty();
    magnitude_values = double.empty();
    angle_values = double.empty();
    for c = 1:cols:8
        for x = c:c+7
            magnitude_values_rows = double.empty();
            for p = r:r+7
                magnitude_values_rows = [magnitude_values_rows, mag(x, p)];
            end
            magnitude_values = [magnitude_values; magnitude_values_rows];
        end
        for w = c:c+7
            angle_values_rows = double.empty();
            for q = r:r+7
                angle_values_rows = [angle_values_rows, theta(w, q)];
                
            end
            angle_values = [angle_values; angle_values_rows];
        end
        for k = 1:length(magnitude_values)
            for l = 1:size(magnitude_values)
                bins = double(zeros(1, number_of_bins));
                value_j = calculate_j(angle_values(k, l));
                Vj = calculate_value_j(magnitude_values(k, l), angle_values(k, l), value_j);
                Vj_1 = magnitude_values(k, l) - Vj;
                bins(value_j) = bins(value_j) +  Vj;
                bins(value_j + 1) = bins(value_j + 1) + Vj_1;
                
                for x = 1:length(bins)
                    bins = [bins, round(bins(x), 9)];
                end
            end
            temp = [temp, bins];
        end
                      
    end
    histogram_points_nine = [histogram_points_nine; temp]; 
end
size(histogram_points_nine)
size(histogram_points_nine, 1)
size(histogram_points_nine, 2)
size(histogram_points_nine, 3)

function j = calculate_j(angle)
    global step_size
    temp = (angle / step_size) - 0.5;
    x = round(temp);
    if x > 0
        j = x + 1;
    elseif x < 0
        j = 9 + x;
    else
        j=1;
    end
        
end

function Cj = calculate_Cj(j)
    global step_size
    Cj = step_size * (j + 0.5);
end

function Vj = calculate_value_j(magnitude, angle, j)
    global step_size
    Cj = calculate_Cj(j + 1);
    Vj = magnitude * ((Cj- angle) / step_size);
end







        
                
      
        