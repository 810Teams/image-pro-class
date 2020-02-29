%
% ex4_01.m
%

clear all;
close all;

f = zeros(256, 256);
f(128 - 15:128 + 15, 128 - 15:128 + 15) = 1;
figure(1);
imshow(f);

F = fft2(double(f));
figure(2);
imshow(abs(F), []);

Fc = fftshift(double(F));
figure(3);
imshow(abs(Fc), []);

S2 = log(1 + abs(Fc));
figure(4);
imshow(abs(S2), []);

figure(5);
mesh(abs(F));
