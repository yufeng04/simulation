function [ output ] = differenceAnalysis(image, keys, type)
% verify anti differential attack (NPCR and UACI)
% parmas: (plain image, secret keys, algorithm)
% return: the values of NPCR and UACI

% get size
[imgM, imgN] = size(image);

% change one pixel
img_changed = image;
if img_changed(1, 1) ~= 128
    img_changed(1, 1) = 128;
else
    img_changed(1, 1) = 64;
end

% encrypt the plain image
if type == 'original'
    encrypted_image = encrypt(image, keys, 4);
    encrypted_image_changed = encrypt(img_changed, keys, 4);
end
if type == 'improved'
    encrypted_image = improvedEncrypt(image, keys, 3);
    encrypted_image_changed = improvedEncrypt(img_changed, keys, 3);
end
if type == 'improve4'
    encrypted_image = improvedEncrypt(image, keys, 4);
    encrypted_image_changed = improvedEncrypt(img_changed, keys, 4);
end

% NPCR UACI
% the max pixel value
T = 255;
% total pixels
G = imgM * imgN;

% NPCR: the different pixels between encrypted_image and encrypted_image_changed
A = zeros(imgM, imgN);
% UACI: the different pixels between encrypted_image and encrypted_image_changed
% absolute value after subtraction
D = zeros(imgM, imgN);
for i = 1 : imgM
    for j = 1 : imgN
        if encrypted_image(i, j) == encrypted_image_changed(i, j)
            A(i, j) = 0;
        else
            A(i, j) = 1;
        end
        D(i, j) = abs(encrypted_image(i, j) - encrypted_image_changed(i, j));
    end
end
npcr = sum(A(:)) / G;
uaci = sum(D(:)) / (G * T);
output = [];
output(1) = npcr;
output(2) = uaci;

%NPCR score alpha = 0.05
% Na = (G - norminv(0.05, 0, 1) * sqrt(G / T)) / (G + 1);

%UACI score
% mu = (G + 2) / (3 * G + 3);
% sigma = (G + 2) * (G^2 + 2 * G + 3) / (18 * (G + 1)^2 * G * T);
% UaLower = mu - norminv(0.05 / 2, 0, 1) * sigma;
% UaUpper = mu + norminv(0.05 / 2, 0, 1) * sigma;

% 512 * 512
% Na = 0.995893;
% UaLower = 0.33373;
% UaUpper = 0.335541;

% Do the result pass the test?
% if npcr > Na
%     npcrRes = 'pass NPCR'
% else
%     npcrRes = 'not pass NPCR'
% end
% if uaci > UaLower && uaci < UaUpper
%     uaciRes = 'pass UACI'
% else
%     uaciRes = 'not pass UACI'
% end

end



