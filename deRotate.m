function [reverse_result] = deRotate(image, angle)
%DEROTATE
% reverse operation of rotating
% params: (encrypted image, degrees)
% return: reverse result

reverse_result = rot90(image,angle);

end

