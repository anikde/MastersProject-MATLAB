function images = getImageArray(dir_path, image_format)
    imagefile_path = dir(strcat(dir_path, image_format));
    nfiles = length(imagefile_path);
    
    for ii = 1:nfiles
    currentfilename = imagefile_path(ii).name;
    filename = currentfilename;
    images{ii} = imread(strcat(dir_path, filename));
    end
    
    %transpose
    images = images.';
end