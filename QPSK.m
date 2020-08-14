num_symbols = 1e4;
int_symbols = randi([0, 3], 1, num_symbols);
A = sqrt(2);
qpsk_symbols = zeros(size(int_symbols));
qpsk_symbols(int_symbols == 3) =   A + 1i*A;
qpsk_symbols(int_symbols == 2) =   A - 1i*A;
qpsk_symbols(int_symbols == 1) = - A + 1i*A;
qpsk_symbols(int_symbols == 0) = - A - 1i*A;
tx_sig = qpsk_symbols;

fh1 = figure;
plot_lims = [-2 2];
plot(real(qpsk_symbols), imag(qpsk_symbols), '.');
xlim(plot_lims);
ylim(plot_lims);
title('QPSK constellation without noise');
xlabel('real part');
ylabel('imaginary part');