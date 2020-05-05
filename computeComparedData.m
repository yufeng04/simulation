% compare IC-BSIF and improved algorithm; compute compared data

% read images
% % 128 * 128
% cuadrado3 = imread('./ilu128_001/cuadrado3.pgm');
% fig31_10 = imread('./ilu128_001/fig31_10.pgm');
% % 256 * 256
% carnev = imread('./g256_005/carnev.pgm');
% fiore = imread('./g256_005/fiore.pgm');
% % 512 * 512
% lena = imread('./g512_006/lena.pgm');
% baboon = imread('./g512_001/47.pgm');

%% keys = generateKey(4);
%% keep the secret keys same
% keys = [0.4455, 0.4796, 0.2736, 0.0693];

%% compute the NPCR and UACI
% original_NPCR_UACI = differenceAnalysis(baboon, keys, 'original');
% improved_NPCR_UACI = differenceAnalysis(baboon, keys, 'improved');
% improved4_NPCR_UACI = differenceAnalysis(baboon, keys, 'improve4');

%% compute the correlations
% encrypted_img = encrypt(lena, keys, 4);
% original_cor = adjacentPixel(encrypted_img)
% encrypted_img_improved = improvedEncrypt(lena, keys, 3);
% improved_cor = adjacentPixel(encrypted_img_improved)
% encrypted_img_improved4 = improvedEncrypt(lena, keys, 4);
% improved_cor4 = adjacentPixel(encrypted_img_improved4)

%% compute the efficiency
% efficiency = zeros([20, 6]);
% for i = 1 : 20
%    efficiency(i, :) = comparePerf();
% end
% efficiency_total = sum(efficiency);
% efficiency_mean = efficiency_total / 20







