function [ scrambled_result ] = blockBasedScrambling(image, key)
%BLOCKBASEDSCRAMBLING
% IC-BSIF: block based scrambling
% params: (the image need to be scrambled, secret key)
% return: scrambled result

% get the size of image
[imgM,imgN] = size(image);
% compute the count of block according to the IC-BSIF
L = min(floor(sqrt(imgM)),floor(sqrt(imgN)));
% generate the random sequence
% parmas: (length of random sequence, secret key)
random_sequence = generateRandomSequence(1, 2 * L^2, key, false);

% start scramble
% save the original value
tempory_image = image;
A = random_sequence(1 : L^2);
B = random_sequence(L^2 + 1 : 2 * L^2);
[~, I] = sort(A);
[~, J] = sort(B);
O = zeros(L^2, L^2);
for j = 1 : L^2
    for i = 1 : L^2
        m = mod(i - J(j) - 1, L^2) + 1;
        O(i, j) = I(m);
    end
end
for i = 1 : L^2
    for j = 1 : L^2
        m1 = floor((i - 1) / L) * L + 1;
        n1 = mod((i - 1), L) * L + 1;
        m2 = floor((j - 1) / L);
        n2 = mod((j - 1), L);
        x = m1 + m2;
        y = n1 + n2;
        image(j, O(i, j)) = tempory_image(x, y);
    end
end

% return
scrambled_result = image;
% figure('Name', 'scrambled_result');
% imshow(uint8(scrambled_result));

end

