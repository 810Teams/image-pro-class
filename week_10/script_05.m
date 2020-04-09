%
% script_05.m
% IPT function: bwhitmiss
%

clear all;
close all;

f = imread('img/small_squares.tif');

B1 = strel([0 0 0; 0 1 1; 0 1 0]);
B2 = strel([1 1 1; 1 0 0; 1 0 0]);

g = bwhitmiss(f, B1, B2);

figure(1);
subplot(1, 2, 1), imshow(f);
subplot(1, 2, 2), imshow(g, []);
