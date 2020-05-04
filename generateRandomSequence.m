function [ random_sequence ] = generateRandomSequence(dimension, length, key, modValue)
%GENERATERANDOMSEQUENCE
% generate random sequence
% params: (dimension, length of random sequence, initial key)
% return: random sequence

% init
u = 3.999;
tempory_key = key;
tempory_sequence = zeros(dimension, length);

% start
for idx = 1 : dimension
    for idy = 1 : length
        tempory_key = u * tempory_key * (1 - tempory_key);
        tempory_sequence(idx, idy) = round(tempory_key * 10^14);
        if modValue
            tempory_sequence(idx, idy) = mod(round(tempory_key * 1000), modValue);
        end
    end
end

% return
random_sequence = tempory_sequence;

end

