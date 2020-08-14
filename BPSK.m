N = 100; % number of symbols
M = 2;   % constellation size
k = log2(M); % bits per symbol

ipBit = rand(1,N*k,1)>0.5; % random 1's and 0's
ipBitReshape = reshape(ipBit,k,N).';
symbol_index = bin2dec(num2str(ipBitReshape));

A = 0;
bpsk_sym(symbol_index == 1) =   1 + 1i*A;
bpsk_sym(symbol_index == 0) = - 1 + 1i*A;

fh1 = figure;
plot_lims = [-4 4];
plot(real(bpsk_sym), imag(bpsk_sym), 'O');
grid on
xlim(plot_lims);
ylim(plot_lims);
title('BPSK constellation map');
xlabel('In-phase Component');
ylabel('Quadrature Component');