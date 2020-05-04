function [ filter_result ] = imageFilter(image, key)
%IMAGEFILTER
% image filter of IC-BSIF
% params: (the image need to be filterred, secret key)
% return: filter result
  
% generate the mask
mask = generateRandomSequence(3, 3, key, 256);
mask(3,3) = 1;
mask = int64(mask);

% get the size of image
[imgM,imgN] = size(image);
% Fill left and top areas according to the IC-BSIF
fill_image = int64(zeros(imgM + 2, imgN + 2));
[tmpM, tmpN] = size(fill_image);
for i = 3 : tmpM
    for j = 3 : tmpN
        fill_image(i, j) = image(i - 2, j - 2);
    end
end
fill_image(1 : 2, 3 : tmpN) = image(imgM - 1 : imgM, 1 : imgN);
fill_image(4 : tmpM, 1 : 2) = image(1 : imgM - 1, imgN - 1 : imgN);
fill_image(1 : 3, 1 : 2) = image(imgM - 2 : imgM, imgN - 1 : imgN);

for i = 1 : imgM
    for j = 1 : imgN
        tmpmask = mask.*fill_image(i : i + 2, j : j + 2);
        fill_image(i + 2,j + 2) = mod(sum(tmpmask(:)), 256);
    end
end


% return
filter_result = fill_image;
% figure('Name', 'filter_result');
% imshow(uint8(filter_result));

end

