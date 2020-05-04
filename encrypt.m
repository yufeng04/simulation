function [encrypted_img] = encrypt(plain_img, keys, round_time)
%ENCRYPT
% use the original algorithm(IC-BSIF) to encrypt plain image
% parmas: (plain_image, secret_keys, round_time)
% return: the encrypted result of IC-BSIF

% start
% global value
intermediate_result = plain_img;
for round = 1 : round_time
    % the secret key of every step
    step_key = keys(round);
    % block based scrambling
    scramble_result = blockBasedScrambling(intermediate_result, step_key);
    % rotate 90 degrees clockwise
    rotate_result = rotate(scramble_result, 3 * round);
    % image normalized
    normalize_result = normalize(rotate_result, step_key);
    % image filter
    image_filter_result = imageFilter(normalize_result, step_key);
    % for next round
    intermediate_result = image_filter_result;
end
% return the encrypted result
encrypted_img = intermediate_result;
% figure('Name', 'ICBSIF_encrypt');
% imshow(uint8(encrypted_img));
end


