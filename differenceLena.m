function [adjacentPixelCorr] = differenceLena(plain_image, keys)
%DIFFERENCELENA
% verify the anti differential ability of improved algorithm
% parmas: (plain image, secret keys)
% return: the adjacent pixels correlation of differential Lena

% init
adjacentPixelCorr = zeros(3, 3);

% get the size of plain image
[imgM, imgN] = size(plain_image);

% change one pixel of plain image
changed_plain = plain_image;
% change the last pixel to 66
changed_plain(imgM, imgN) = 66;

% use the improved algorithm to encrypt
encrypted_image_1 = improvedEncrypt(plain_image, keys, 1);
encrypted_changed_1 = improvedEncrypt(changed_plain, keys, 1);
% different the encrypted image
differential_image_1 = mod(encrypted_image_1 - encrypted_changed_1, 256);
% compute the adjacent pixels correlation
adjacentPixelCorr(1, 1 : 3) = adjacentPixel(differential_image_1);

% use the improved algorithm to encrypt
encrypted_image_2 = improvedEncrypt(plain_image, keys, 2);
encrypted_changed_2 = improvedEncrypt(changed_plain, keys, 2);
% different the encrypted image
differential_image_2 = mod(encrypted_image_2 - encrypted_changed_2, 256);
% compute the adjacent pixels correlation
adjacentPixelCorr(2, 1 : 3) = adjacentPixel(differential_image_2);

% use the improved algorithm to encrypt
encrypted_image_3 = improvedEncrypt(plain_image, keys, 3);
encrypted_changed_3 = improvedEncrypt(changed_plain, keys, 3);
% different the encrypted image
differential_image_3 = mod(encrypted_image_3 - encrypted_changed_3, 256);
% compute the adjacent pixels correlation
adjacentPixelCorr(3, 1 : 3) = adjacentPixel(differential_image_3);

adjacentPixelCorr

for i = 1 : 3
    name = ['differential_image_', num2str(i)]; 
    figure('Name', name);
    imshow(uint8(eval(name)));
end

end

