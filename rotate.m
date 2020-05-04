function [ rotated_result ] = rotate(image, angle)
%ROTATE
% rotate the image
% params: (the image need to be rotated, the angle of rotating)
% return: the result of rotating

rotated_result = rot90(image,angle);
end

