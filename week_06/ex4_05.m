% Generating the transfer function of all lowpass filter

clear all;
close all;

[H1, D1] = lpfilter('ideal', 50, 50, 15);
[H2, D2] = lpfilter('btw', 50, 50, 15);
[H3, D3] = lpfilter('gaussian', 50, 50, 15);

figure(1);
subplot(2, 2, 1); mesh(fftshift(H1));
subplot(2, 2, 2); mesh(fftshift(H2));
subplot(2, 2, 3); mesh(fftshift(H3));
