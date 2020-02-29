%
% workshop.m
%

% STEPS
% 1. Read the image.
% 2. Convert the image to grayscale.
% 3. Convert the image to double with normalization (0 to 1 scaling).
% 4. Apply Fourier transformation (fft2), requires double format.
% 5. Apply Fourier transformation shifting (fftshift), requires double format.
% 6. Apply log function in order to see the image clearly.
% 7. Display the image with [] as intensity argument, which does auto scaling.
%    (See https://www.mathworks.com/help/images/ref/imshow.html)

%% Part 1

clear all;
close all;

f1 = double(rgb2gray(imread('dataset/SQ.png')))/255;
f1 = fft2(double(f1));
f1 = fftshift(double(f1));
f1 = log(1 + abs(f1));
figure(1);
subplot(1, 3, 1); imshow(abs(f1), []);

f2 = double(rgb2gray(imread('dataset/Reg_0.png')))/255;
f2 = fft2(double(f2));
f2 = fftshift(double(f2));
f2 = log(1 + abs(f2));
subplot(1, 3, 2); imshow(abs(f2), []);

f3 = double(rgb2gray(imread('dataset/Reg_90.png')))/255;
f3 = fft2(double(f3));
f3 = fftshift(double(f3));
f3 = log(1 + abs(f3));
subplot(1, 3, 3); imshow(abs(f3), []);

%% Part 2

figure(2);
for i = 1 : 6
    c = double(rgb2gray(imread(sprintf('dataset/c%d.png', i - 1))))/255;
    c = fft2(double(c));
    c = fftshift(double(c));
    c = log(1 + abs(c));
    subplot(2, 3, i); imshow(abs(c), []);
end
