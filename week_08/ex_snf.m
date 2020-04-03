%
% ex_snf.m
%

clear all;
close all;

f = imread('img/lena.bmp');
[M, N] = size(f);
R = imnoise2('salt & pepper', M, N, 0.1, 0);
c = find(R == 0);
gp = f;
gp(c) = 0;

figure(1);
subplot(1, 2, 1), imshow(f);
subplot(1, 2, 2), imshow(gp);

R = imnoise2('salt & pepper', M, N, 0, 0.1);
c = find(R == 1);
gs = f;
gs(c) = 255;

figure(2), imshow(gs);

% Using a contraharmonic filter

fp = spfilt(gp, 'chmean', 3, 3, 1.5);
fs = spfilt(gs, 'chmean', 3, 3, -1.5);

figure(3);
subplot(1, 2, 1), imshow(fp);
subplot(1, 2, 2), imshow(fs);

fpmax = spfilt(gp, 'max', 3, 3);
fsmin = spfilt(gs, 'min', 3, 3);

figure(4);
subplot(1, 2, 1), imshow(fpmax);
subplot(1, 2, 2), imshow(fsmin);
