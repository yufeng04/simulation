function [corr_result] = verifyAnalysis(image1, image2, allzeros, keys, type)
%VERIFYANALYSIS
% verify theory analysis
% params: (three plain images, algorithm)
% return: correaltion

%init
image1 = int64(image1);
image2 = int64(image2);
allzeros = int64(allzeros);


% different the plain images
differential_image = mod(image1 + image2 - allzeros, 256);

% get the encrypted images
if type == 'original'
    encrypted_image1 = encrypt(image1, keys, 4);
    encrypted_image2 = encrypt(image2, keys, 4);
    encrypted_allzeros = encrypt(allzeros, keys, 4);
    encrypted_diff = encrypt(differential_image, keys, 4);
end

if type == 'improved'
    encrypted_image1 = improvedEncrypt(image1, keys, 3);
    encrypted_image2 = improvedEncrypt(image2, keys, 3);
    encrypted_allzeros = improvedEncrypt(allzeros, keys, 3);
    encrypted_diff = encrypt(differential_image, keys, 3);
end

% get the difference of encrypted image
differential_encrypted = mod(encrypted_image1 + encrypted_image2 - encrypted_allzeros, 256);

% compare the result
result = mod(encrypted_diff - differential_encrypted, 256);
corr_result = adjacentPixel(result);

end

