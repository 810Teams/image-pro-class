%
% additional_example.m
%

%% fourier transform

clear all;
close all;

f1 = [1 1 1];
F1 = fft(f1);
figure(1);
subplot(1, 3, 1); stem(abs(F1));

f10 = [1 1 1 0 0 0 0 0 0 0];
F10 = fft(f10);
subplot(1, 3, 2); stem(abs(F10));

f20 = [1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
F20 = fft(f20);
subplot(1, 3, 3); stem(abs(F20));

%% simulation of ideal FT

w = 0:2 * pi / 40:2 * pi;
y = exp(-j .* 2 .* w) .* (1 + 2 .* cos(w));
figure, plot(w, abs(y));
