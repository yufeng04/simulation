function [attacked_result] = breakICBSIF(image, keys, isShow)
% use the codebook to break the IC-BSIF
% parmas: (plain image, secret keys, show the attacked result)
% the attacked result

% encrypt the plain image
encrypted_image = double(encrypt(image, keys, 4));
% get the size
[imgM, imgN] = size(image);
[eM, eN] = size(encrypted_image);

% decrypt an all zero image for difference
allZeroImg = zeros(eM, eN);
allzeros_decrypted = decrypt(allZeroImg, keys, 4);

% generate eM * eN pairs of plain/encrypted image
E = zeros(eM * eN, eM, eN);
% construct encrypted image, only has one pixel equal to 1
for i = 1 : eM
    for j = 1 : eN
        for k = 1 : eM * eN
            E(j + (i - 1) * eM, i, j) = 1;
        end
    end
end

% decrypt the constructed encrypted image
P = zeros(eM * eN, imgM, imgN);  

for x = 1 : eM * eN
    P(x, :, :) = decrypt(squeeze(E(x, :, :)), keys, 4);
end

tmpImg = zeros(imgM,imgN);
num = 0;
for n = 1 : eM
    for n1 = 1 : eN
            if encrypted_image(n, n1)~=0
                tmpImg = tmpImg + encrypted_image(n, n1) * squeeze( P( n1 + (n-1) * eM, :, :));
                num = num + encrypted_image(n, n1);
            end
    end
end
tmpImg = int64(tmpImg);
tmpImg = mod(tmpImg - (num - 1) * allzeros_decrypted, 256);
if isShow
    figure('Name', 'plain_image');
    imshow(uint8(image)); 
    figure('Name', 'encrypted_image');
    imshow(uint8(encrypted_image)); 
    figure('Name', 'attacked_result');
    imshow(uint8(tmpImg)); 
end
attacked_result = tmpImg;

end
