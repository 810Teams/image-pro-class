%
% workshop.m
%

clear all
close all

f1 = rgb2gray(imread('dataset/SQ.png'));
f1 = fft2(double(f1));
f1 = fftshift(f1);
f1 = log(1 + abs(f1));
figure, subplot(1, 3, 1); imshow(f1);

f2 = rgb2gray(imread('dataset/Reg_0.png'));
f2 = fft2(double(f2));
f2 = fftshift(f2);
f2 = log(1 + abs(f2));
subplot(1, 3, 2); imshow(f2);

f3 = rgb2gray(imread('dataset/Reg_90.png'));
f3 = fft2(double(f3));
f3 = fftshift(f3);
f3 = log(1 + abs(f3));
subplot(1, 3, 3); imshow(f3);

%%

figure;
for i = 1 : 6
    c = rgb2gray(imread(sprintf('dataset/c%d.png', i - 1)));
    c = fft2(double(c));
    c = fftshift(c);
    c = log(1 + abs(c));
    subplot(2, 3, i); imshow(c, []);
end

















