function [ compare_result ] = comparePerf()
%COMPAREPERF
% compare performance between original and improved algorithm
% return: compared result

% get the plain image
lena = imread('../test_img/LenaRGB1.bmp');

% adjust the plain image
% to gray image
lena = rgb2gray(lena);

% generate the secret keys for encrypting
keys = generateKey(4);

% collect the result
compare_result = [];

% size = [512, 512]
% IC-BSIF
tic
    encrypted_img = encrypt(lena, keys, 4);
toc
compare_result(1) = toc;
tic
    decrypted_img = decrypt(encrypted_img, keys, 4);
toc
compare_result(2) = toc;
% improved algorithm: round time = 3
tic
    encrypted_img_improved = improvedEncrypt(lena, keys, 3);
toc
compare_result(3) = toc;
tic
    decrypted_img_improved = improvedDecrypt(encrypted_img_improved, keys, 3);
toc
compare_result(4) = toc;
% improved algorithm: round time = 4
tic
    encrypted_img_improved = improvedEncrypt(lena, keys, 4);
toc
compare_result(5) = toc;
tic
    decrypted_img_improved = improvedDecrypt(encrypted_img_improved, keys, 4);
toc
compare_result(6) = toc;

% adjust the size
lena_256 = imresize(lena, [256, 256]);
% IC-BSIF
tic
    encrypted_img = encrypt(lena_256, keys, 4);
toc
compare_result(7) = toc;
tic
    decrypted_img = decrypt(encrypted_img, keys, 4);
toc
compare_result(8) = toc;
% improved algorithm: round time = 3
tic
    encrypted_img_improved = improvedEncrypt(lena_256, keys, 3);
toc
compare_result(9) = toc;
tic
    decrypted_img_improved = improvedDecrypt(encrypted_img_improved, keys, 3);
toc
compare_result(10) = toc;
% improved algorithm: round time = 4
tic
    encrypted_img_improved = improvedEncrypt(lena_256, keys, 4);
toc
compare_result(11) = toc;
tic
    decrypted_img_improved = improvedDecrypt(encrypted_img_improved, keys, 4);
toc
compare_result(12) = toc;

% adjust the size
lena_128 = imresize(lena, [128, 128]);
% IC-BSIF
tic
    encrypted_img = encrypt(lena_128, keys, 4);
toc
compare_result(13) = toc;
tic
    decrypted_img = decrypt(encrypted_img, keys, 4);
toc
compare_result(14) = toc;
% improved algorithm: round time = 3
tic
    encrypted_img_improved = improvedEncrypt(lena_128, keys, 3);
toc
compare_result(15) = toc;
tic
    decrypted_img_improved = improvedDecrypt(encrypted_img_improved, keys, 3);
toc
compare_result(16) = toc;
% improved algorithm: round time = 4
tic
    encrypted_img_improved = improvedEncrypt(lena_128, keys, 4);
toc
compare_result(17) = toc;
tic
    decrypted_img_improved = improvedDecrypt(encrypted_img_improved, keys, 4);
toc
compare_result(18) = toc;

% adjust the size
lena_64 = imresize(lena, [64, 64]);
% IC-BSIF
tic
    encrypted_img = encrypt(lena_64, keys, 4);
toc
compare_result(19) = toc;
tic
    decrypted_img = decrypt(encrypted_img, keys, 4);
toc
compare_result(20) = toc;
% improved algorithm: round time = 3
tic
    encrypted_img_improved = improvedEncrypt(lena_64, keys, 3);
toc
compare_result(21) = toc;
tic
    decrypted_img_improved = improvedDecrypt(encrypted_img_improved, keys, 3);
toc
compare_result(22) = toc;
% improved algorithm: round time = 4
tic
    encrypted_img_improved = improvedEncrypt(lena_64, keys, 4);
toc
compare_result(23) = toc;
tic
    decrypted_img_improved = improvedDecrypt(encrypted_img_improved, keys, 4);
toc
compare_result(24) = toc;


end

