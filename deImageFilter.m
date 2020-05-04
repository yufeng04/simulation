function [reverse_result] = deImageFilter(image, key)
%DEIMAGEFILTER
% the reverse operation of image filter
% parmas: (encrypted image, secret key)
% return: reverse result

%init
image = int64(image);
% generate the mask
mask = generateRandomSequence(3, 3, key, 256);
mask(3,3) = 1;
mask = int64(mask);

% get the size of image
[imgM,imgN] = size(image);

intermediate_image = int64(zeros(imgM, imgN));
for i = imgM : -1 : 3
    for i1 = imgN : -1 : 3
        tmpMask = mask.*image((i - 2) : i, (i1 - 2) : i1);
        tmpData = 2 * image(i, i1) - sum(tmpMask(:));
        image(i, i1) = mod(tmpData, 256);
        intermediate_image(i, i1) = image(i, i1);
    end
end

% return
reverse_result = intermediate_image(3 : imgM, 3 : imgN);
end

