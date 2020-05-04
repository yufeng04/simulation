function [normalized_image] = normalize(image, key)
%NORMALIZE
% normalize image
% params: (image, secret key)
% return: normalized image

% init
u = 3.999;

% get the size of image
[imgM,imgN] = size(image);
% generate the matrix Q
Q = int64(zeros(imgM, imgN));
for i = 1 : imgM
    for j = 1 : imgN
        key = u * key * (1 - key);
        Q(i, j)=mod(floor(key * (10^14)), 256);
        image(i, j)=mod(int64(image(i, j)) + Q(i, j), 256);
    end
end

normalized_image = image;

end

