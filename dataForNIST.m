function [ output ] = dataForNIST(image, txtName)
% Processing images as binary data for NIST test
% 
ten = uint8(image);
[imgM,imgN] = size(ten);
txtName = strcat(txtName, '.txt');
for m = 1 : imgM
    for n = 1 : imgN
        temp = dec2base(ten(m, n), 2, 8);
        str = temp';
        fp = fopen(txtName,'a');
        fprintf(fp,'%s',str);
        fclose(fp);
    end
end
output = 'Data for NIST'
end



