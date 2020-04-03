%
% workshop.m
%

clear all;
close all;

% Read image
f = imread('img/lena.bmp');

% Create motion blur filters
mb1 = fspecial('motion', 8, 0);
mb2 = fspecial('motion', 10, 60);
mb3 = fspecial('motion', 8, 90);

% Applying filters
gb1 = imfilter(f, mb1, 'circular');
gb2 = imfilter(f, mb2, 'circular');
gb3 = imfilter(f, mb3, 'circular');

% Display
figure(1);
subplot(1, 3, 1), imshow(gb1);
subplot(1, 3, 2), imshow(gb2);
subplot(1, 3, 3), imshow(gb3);
