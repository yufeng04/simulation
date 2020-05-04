function [decrypted_img] = improvedDecrypt(encrypted_img, keys, round_time)
%DECRYPT
% decrypt the encrypted image by IC-BSIF
% params: (encrypted image, the keys for decrypting, round time)
% return: decrypted image

% start
% global value
intermediate_result = encrypted_img;
for round = round_time : -1 : 1
    % the secret key of every step
    step_key = keys(round);
    % reverse image filter
    reverse_image_filter_result = deImageFilter(intermediate_result, step_key);
    % reverse normalized operation
    reverse_normalized_result = deNormalize(reverse_image_filter_result, step_key);
    
    % related to plaintext
    plain_factor = floor(mean(reverse_normalized_result(:))) / 1000;
    rotate_sequence = generateRandomSequence(1, 4, plain_factor, 256);
    [~, A] = sort(rotate_sequence);
    angle_list = [A(1) - A(4), A(2) - A(1), A(3) - A(2), A(4) - A(3)];
    
    related_plain_result = reverse_normalized_result;
    for rotate_time = 4 : -1 : 1
        % reverse rotate 90 degrees clockwise
        reverse_rotate_result = deRotate(related_plain_result, 4 - angle_list(rotate_time));
        % reverse block based scrambling
        reverse_scramble_result = deBlockBasedScrambling(reverse_rotate_result, step_key);
        related_plain_result = reverse_scramble_result;
    end
    reverse_scramble_result = related_plain_result;
    
    % for next round
    intermediate_result = reverse_scramble_result;
end

% return the decrypted result
decrypted_img = intermediate_result;
% figure('Name', 'improved_decrypt');
% imshow(uint8(decrypted_img));

end

