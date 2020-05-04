% Main function of IC-BSIF. This script can do following thing:
% 1. generate the secret keys
% 2. encrypt the plain image
% 3. decrypt the encrypted image
% 4. run the improved algorithm
% 5. compare performance between original and improved algorithm
% 6. draw the histogram of the plain/encrypted image
% 7. generate binary text files for NIST testing
% 8. analysis of anti differential attack ability (NPCR UACI)
% 9. adjacent pixel correlation
% 10. select plaintext attack (codebook)

clear;clc;
% the global value
% the round time of encrypting
round_time = 4;
% get the plain image
lena = imread('../test_img/LenaRGB1.bmp');
baboon = imread('../test_img/BaboonRGB.bmp');

% adjust the plain image
% to gray image
lena = rgb2gray(lena);
baboon = rgb2gray(baboon);
% % adjust the size
adjust_size = [64, 64];
lena = imresize(lena,adjust_size);
% baboon = imresize(baboon,adjust_size);
% % create all zeros image
% allZeros = zeros(adjust_size);

%1. generate the secret keys for encrypting
keys = generateKey(4);

%2. encrypt the plain image by the IC-BSIF
% parmas: (plain_image, secret_keys, round_time)
% encrypted_img = encrypt(lena, keys, round_time);
% verified_result_icbsif = verifyAnalysis(lena, baboon, allZeros, keys, 'original');

%3. decrypt the encrypted image by the IC-BSIF
% params: (encrypted_image, secret_keys, round_time)
% decrypted_img = decrypt(encrypted_img, keys, round_time);

%4. run the improved algorithm
% params: (encrypted_image, secret_keys, round_time)
% encrypted_img_improved = improvedEncrypt(lena, keys, round_time);
% decrypted_img_improved = improvedDecrypt(encrypted_img_improved, keys, round_time);
% verified_result_improved = verifyAnalysis(lena, baboon, allZeros, keys, 'improved');

%5. compare performance between original and improved algorithm
% parmas: ()
% compare_perf_results = comparePerf();

%6. draw the histogram of the plain/encrypted image
% parmas: (plain/encryped image, show the histogram)
% drawHistogram(encrypted_img);

%7. generate binary text files for NIST testing
% parmas: (encrypted image, file name)
% dataForNIST(encrypted_img, 'nist_test_data');

%8. analysis of anti differential attack ability (NPCR UACI)
%parmas: (plain image, secret key, type of algorithm)
% original_NPCR_UACI = differenceAnalysis(baboon, keys, 'original')
% improved_NPCR_UACI = differenceAnalysis(baboon, keys, 'improved')
% differenceLena(lena, keys);

%9. adjacent pixel correlation
%params: (encrypted image)
% correlation_result = adjacentPixel(encrypted_img);

% 10. select plaintext attack (codebook)
% params: (plain image, secret keys
%          show the encrypted/plain/attacked image)
attcked_result = breakICBSIF(lena, keys, true);






