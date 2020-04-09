%
% script_03.m
% IPT function: imerode
%

clear all;
close all;

A = imread('img/wirebond_mask.tif');
se1 = strel('disk', 10);
A1 = imerode(A, se1);
se2 = strel('disk', 5);
A2 = imerode(A, se2);
se3 = strel('disk', 20);
A3 = imerode(A, se3);

figure(1);
subplot(2, 2, 1); imshow(A);
subplot(2, 2, 2); imshow(A1);
subplot(2, 2, 3); imshow(A2);
subplot(2, 2, 4); imshow(A3);
