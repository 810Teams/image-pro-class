%
% degrad5_5.m
%

%% Modeling the degradation function

clear all;
close all;

f = checkerboard(8);
figure(1);
subplot(2, 3, 1), imshow(im2uint8(mat2gray(f)));

PSF = fspecial('motion', 7, 45);   % motion blur
gb = imfilter(f, PSF, 'circular'); % apply filter
subplot(2, 3, 2), imshow(im2uint8(mat2gray(gb)));

noise = imnoise(zeros(size(f)), 'gaussian', 0, 0.001); % create noise
subplot(2, 3, 4), imshow(im2uint8(mat2gray(noise)));

g = gb + noise; % add noise

subplot(2, 3, 5), imshow(im2uint8(mat2gray(g)));
subplot(2, 3, 6), imshow(pixeldup(f, 8), []);

%% Restoration using direct inverse filter technique

frl = deconvwnr(g, PSF);
figure(2);
subplot(1, 2, 1), imshow(im2uint8(mat2gray(frl)));

Sn = abs(fft2(noise)).^2;          % noise power spectrum
nA = sum(Sn(:))/prod(size(noise)); % noise average power
Sf = abs(fft2(f)).^2;              % image power spectrum
fA = sum(Sf(:))/prod(size(f));     % image average power
R = nA/fA;

fr2 = deconvwnr(g, PSF, R);
subplot(1, 2, 2), imshow(im2uint8(mat2gray(fr2)));

%% Restoration using autocorrelation function

NCORR = fftshift(real(ifft2(Sn)));
ICORR = fftshift(real(ifft2(Sf)));
fr3 = deconvwnr(g, PSF, NCORR, ICORR);
figure(3), imshow(im2uint8(mat2gray(fr3)));

%% Restoration using constrained least qquares (regularized) filtering

fr4 = deconvreg(g, PSF, 1);   % noise power is approximately 2
figure(4)
subplot(1, 2, 1), imshow(im2uint8(mat2gray(fr4)));

fr5 = deconvreg(g, PSF, 0.9, [1e-7 1e7]);
subplot(1, 2, 2), imshow(im2uint8(mat2gray(fr5)));
