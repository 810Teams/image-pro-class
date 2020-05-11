%
% degrad5_10.m
%

clear all;
close all;

f = checkerboard(8);
figure(1);
subplot(3, 2, 1), imshow(pixeldup(f, 8), []);
subplot(3, 2, 2), imshow(f);

PSF = fspecial('gaussian', 5, 45);
subplot(3, 2, 3), imshow(pixeldup(PSF, 73), []);
subplot(3, 2, 4), imshow(PSF);
SD = 0.05;
g = imnoise(imfilter(f, PSF), 'gaussian', 0, SD^2);
subplot(3, 2, 5), imshow(g);

INITPSF = ones(size(PSF));
NUMIT = 10; % number of iterations
DAMPAR = 10*SD; % dampling parameter
LIM = ceil(size(PSF, 1)/2);
WEIGHT = zeros(size(g));
WEIGHT(LIM + 1:end - LIM, LIM + 1:end - LIM) = 1;
[fr, PSFs] = deconvblind(g, INITPSF, NUMIT, DAMPAR, WEIGHT);
subplot(3, 2, 6), imshow(fr);
