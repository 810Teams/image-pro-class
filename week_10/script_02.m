%
% script_02.m
% IPT function: imdilate
%

clear all;
close all;

A1 = imread('img/broken_text.tif');
B = [0 1 0;
     1 1 1;
     0 1 0];
A2 = imdilate(A1, B); % dilation

figure(1);
subplot(1, 2, 1), imshow(A1);
subplot(1, 2, 2), imshow(A2);
