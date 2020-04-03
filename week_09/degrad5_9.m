%
% degrad5_9.m
%

clear all;
close all;

% Create checkerboard
f = checkerboard(8);
figure(1);
subplot(2, 3, 1), imshow(im2uint8(mat2gray(f)));
subplot(2, 3, 2), imshow(pixeldup(f, 8), []);

% Apply motion blur and noise
PSF = fspecial('motion', 7, 10);
SD = 0.01;
g = imnoise(imfilter(f, PSF), 'gaussian', 0, SD^2);
subplot(2, 3, 3), imshow(g);

% Lucy-Richardson Algorithm parameters
DAMPAR = 5 * SD; % dampling parameter
LIM = ceil(size(PSF, 1)/2);
WEIGHT = zeros(size(g));
WEIGHT(LIM + 1:end - LIM, LIM + 1:end - LIM) = 1;
NUMIT = 10; % number of iterations

% Lucy-Richardson Algorithm Apply
fr = deconvlucy(g, PSF, NUMIT, DAMPAR, WEIGHT);
subplot(2, 3, 4), imshow(pixeldup(fr, 8));
subplot(2, 3, 5), imshow(fr);
