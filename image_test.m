image_file = fopen('fruits.png', 'r');
img2bits = fread(image_file,'ubit1')';
bits2chunks = reshape(img2bits,[],4);
% symbol_index = bin2dec(num2str(bits2chunks));


cplx2dec(sixteen_QAM == num2str(-3 + 3i)) = 1;
cplx2dec(sixteen_QAM == num2str(-3 + 1i)) = 2;
cplx2dec(sixteen_QAM == num2str(-3 - 3i)) = 3;
cplx2dec(sixteen_QAM == num2str(-3 - 1i)) = 3;
cplx2dec(sixteen_QAM == num2str(-1 + 3i)) = 4;
cplx2dec(sixteen_QAM == num2str(-1 + 1i)) = 5;
cplx2dec(sixteen_QAM == num2str(-1 - 3i)) = 6;
cplx2dec(sixteen_QAM == num2str(-1 - 1i)) = 7;
cplx2dec(sixteen_QAM == num2str(+3 + 3i)) = 8;
cplx2dec(sixteen_QAM == num2str(+3 + 1i)) = 9;
cplx2dec(sixteen_QAM == num2str(+3 - 3i)) = 10;
cplx2dec(sixteen_QAM == num2str(+3 - 1i)) = 11;
cplx2dec(sixteen_QAM == num2str(+1 + 3i)) = 12;
cplx2dec(sixteen_QAM == num2str(+1 + 1i)) = 13;
cplx2dec(sixteen_QAM == num2str(+1 - 3i)) = 14;
cplx2dec(sixteen_QAM == num2str(+1 - 1i)) = 15;
% 
% recovered_data = dec2bin(cplx2dec((sixteen_QAM)));
% 
% Fc = 30e6;
% %Cosine wave:
% x = cos(2*pi*Fc*t);
% %Sine wave:
% y = sin(2*pi*Fc*t);
%  