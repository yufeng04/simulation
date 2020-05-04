function [corr_result] = adjacentPixel(image)
% Correlation test of adjacent pixels in image
% horizontal/vertical/diagonal
% parmas: any image
% return: the results of correlation test

image = double(image);
% get the size of image
[imgM, imgN] = size(image);
% the count of pixels
length = imgM * imgN;

% compute the horizontal correlation
h = image(:);
x_h = h(1 : length - 1);
y_h = h(2 : length);
AC_h = min(min(corrcoef(x_h, y_h)));
corr_result(1) = AC_h;

% compute the vertical correlation
image_v = image';
v = image_v(:);
x_v = v(1 : length - 1);
y_v = v(2 : length);
AC_v = min(min(corrcoef(x_v, y_v)));
corr_result(2) = AC_v;

% compute the diagonal correlation
d_x = image(1 : imgM-1, 1 : imgN-1);
d_y = image(2 : imgM, 2 : imgN);
x_d = d_x(:);
y_d = d_y(:);
AC_d = min(min(corrcoef(x_d, y_d)));
corr_result(3) = AC_d;
end


