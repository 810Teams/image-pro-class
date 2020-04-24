%
% gray_recon_op.m
%

clear all;
close all;

f = imread('img/dowels.tif');
se = strel('disk', 5);

% Opening by reconstruction
fe = imerode(f, se);
fobr = imreconstruct(fe, f);

% Closing by reconstruction
fobrc = imcomplement(fobr); % complemented image
fobrce = imerode(fobrc, se); % eroded complemented image
fobrcer = imreconstruct(fobrce, fobrc); % reconstructed complemented image
fobrcer = imcomplement(fobrcer); % returned to non-complemented version

figure(1);
subplot(2, 2, 1), imshow(f); % original image
subplot(2, 2, 2), imshow(fe); % eroded image
subplot(2, 2, 3), imshow(fobr); % recontructed eroded image with original image
subplot(2, 2, 4), imshow(fobrcer);
