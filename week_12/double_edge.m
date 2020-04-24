%
% double_edge.m
% Demo of double edge effect
%

clear all;
close all;

sq = zeros(256);
sq(64:192, 64:192) = 256;

ft = 1/25 .* ones(5); % 5x5 mask, simple low-pass filter
sq1 = conv2(double(sq - 128), ft);

lp = fspecial('log', [5 5], 0.5); % log = Laplacian of Gaussian
sq2 = conv2(sq1, lp);

figure(1);
subplot(1, 3, 1), imshow(sq);
subplot(1, 3, 2), imshow(uint8(sq1));
subplot(1, 3, 3), imshow(uint8(sq2 + 128), []);
