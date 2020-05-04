function [ encrypted_img ] = improvedEncrypt(image, keys, round_time)
%IMPROVEDENCRYPT
% the improved algorithm of IC-BSIF
% params: (plain image, secret keys, round time)
% return: encrypted image

% start
% global value
intermediate_result = image;
for round = 1 : round_time
    % the secret key of every step
    step_key = keys(round);
    % related to plaintext
    plain_factor = floor(mean(intermediate_result(:))) / 1000;
    rotate_sequence = generateRandomSequence(1, 4, plain_factor, 256);
    [~, A] = sort(rotate_sequence);
    angle_list = [A(1) - A(4), A(2) - A(1), A(3) - A(2), A(4) - A(3)];
    related_plain_result = intermediate_result;
    for rotate_time = 1 : 4
        % block based scrambling
        scramble_result = blockBasedScrambling(related_plain_result, step_key);
        % rotate 90 degrees clockwise
        rotate_result = rotate(scramble_result, angle_list(rotate_time));
        related_plain_result = rotate_result;
    end
    intermediate_result = related_plain_result;
    % image normalized
    normalize_result = normalize(intermediate_result, step_key);
    % image filter
    image_filter_result = imageFilter(normalize_result, step_key);
    % for next round
    intermediate_result = image_filter_result;
end
% return the encrypted result
encrypted_img = intermediate_result;
% figure('Name', 'improved_encrypt');
% imshow(uint8(encrypted_img));

end

