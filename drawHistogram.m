function [ histogram ] = drawHistogram(image)
% draw histogram

I = uint8(image);
% subplot(121);
% imshow(I);
% title('cipher-image');
% subplot(122);
imhist(I);
title('Histogram');
histogram = '直方图绘制完成';
end

