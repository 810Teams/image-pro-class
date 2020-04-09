%
% script_01.m
% MATLAB expression for binary images sample
%

clear all;
close all;

utk = imread('img/utk.tif');
gt = imread('img/gt.tif');
comp_utk = ~utk;

figure(1);
subplot(1, 3, 1), imshow(utk);
subplot(1, 3, 2), imshow(gt);
subplot(1, 3, 3), imshow(comp_utk);

AorB = utk | gt;  % or = union
AandB = utk & gt; % and = intersection
AanddifB = utk & ~gt;

figure(2);
subplot(1, 3, 1), imshow(AorB);
subplot(1, 3, 2), imshow(AandB);
subplot(1, 3, 3), imshow(AanddifB);
