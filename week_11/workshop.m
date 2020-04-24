%
% workshop.m
%

clear all;
close all;

% Step 1 - Reconstruct eroded image
f = imread('img/calculator.tif');
f_obr = imreconstruct(imerode(f, ones(1, 71)), f);

% Step 2
se = strel('disk', 20); % at least disk size 19 is working
f_thr = imtophat(f, se);

% Step 3
g_obr = imreconstruct(imerode(f_thr, ones(1, 11)), f_thr);

% Step 4
g_obrd = imdilate(g_obr, ones(1, 21));
f2 = imreconstruct(min(g_obrd, f_thr), f_thr);

% Calculate shadow
shadow = f_thr - (f - f_obr);

figure(1);
subplot(2, 3, 1), imshow(f);
subplot(2, 3, 2), imshow(f_obr);
subplot(2, 3, 3), imshow(f_thr);
subplot(2, 3, 4), imshow(g_obr);
subplot(2, 3, 5), imshow(f2);
subplot(2, 3, 6), imshow(shadow);

figure(2);
imshow(f2 - shadow);

