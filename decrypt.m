function [decrypted_img] = decrypt(encrypted_img, keys, round_time)
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
    % reverse rotate 90 degrees clockwise
    reverse_rotate_result = deRotate(reverse_normalized_result, round);
    % reverse block based scrambling
    reverse_scramble_result = deBlockBasedScrambling(reverse_rotate_result, step_key);
    % for next round
    intermediate_result = reverse_scramble_result;
end

% return the decrypted result
decrypted_img = intermediate_result;
% figure('Name', 'ICBSIF_decrypt');
% imshow(uint8(decrypted_img));

end

