N = 10^9;
M = 16;
k = log2(M);

%sampling_rate = ?;

N_carriers = 400;
N_FFT = 2048;

N_bins = N_FFT/2;
%bin_width = sampling_rate / N_bins;

image_file = fopen('./test-images/fruits.png', 'r');
img2bits = fread(image_file,'ubit1')';
bits2chunks = reshape(img2bits,[],4);

symbol_index = bin2dec(num2str(bits2chunks));

sixteen_QAM(symbol_index == 0) = num2str(-3 + 3i);
sixteen_QAM(symbol_index == 1) = num2str(-3 + 1i);
sixteen_QAM(symbol_index == 2) = num2str(-3 - 3i);
sixteen_QAM(symbol_index == 3) = num2str(-3 - 1i);
sixteen_QAM(symbol_index == 4) = num2str(-1 + 3i);
sixteen_QAM(symbol_index == 5) = num2str(-1 + 1i);
sixteen_QAM(symbol_index == 6) = num2str(-1 - 3i);
sixteen_QAM(symbol_index == 7) = num2str(-1 - 1i);
sixteen_QAM(symbol_index == 8) = num2str(+3 + 3i);
sixteen_QAM(symbol_index == 9) = num2str(+3 + 1i);
sixteen_QAM(symbol_index == 10) = num2str(+3 - 3i);
sixteen_QAM(symbol_index == 11) = num2str(+3 - 1i);
sixteen_QAM(symbol_index == 12) = num2str(+1 + 3i);
sixteen_QAM(symbol_index == 13) = num2str(+1 + 1i);
sixteen_QAM(symbol_index == 16) = num2str(+1 - 3i);
sixteen_QAM(symbol_index == 15) = num2str(+1 - 1i);

N_symbols = ceil(length(sixteen_QAM)/ N_carriers);

ofdm_symbols = [];

intermidate_spectrum = zeros(N_FFT,1); %2048 zeros
intermidate_spectrum(1:N_carriers, :) = sixteen_QAM(1:N_carriers, :);

if rem(length(sixteen_QAM), N_carriers) ~= 0
    intermidate_spectrum = cat(intermidate_spectrum, zeros(rem(length(sixteen_QAM), N_carriers)));
end

for i =1 : N_symbols
    %we put 400 complex numbers at the beginning of the sample_signal
    % concatenate to ofdm symbol array
    
    single_symbol = ifft(intermidate_spectrum, N_FFT);
    ofdm_symbols = cat(ofdm_symbols, single_symbol);
end



plot_lims = [-4 4];
plot(real(sixteen_QAM), imag(sixteen_QAM), 'O');
grid on
xlim(plot_lims);
ylim(plot_lims);
title('16-QAM Constellation map');
xlabel('In-phase Component');
ylabel('Quadrature Component');