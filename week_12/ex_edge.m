%
% ex_edge.m
% SOBEL Edge Detection Samples
%

% [g, t] = edge(f, 'method', parameters);

f = imread('img/lena.bmp');
T = [];

[g1, t1] = edge(f, 'sobel', T, 'vertical');

[g2, t2] = edge(f, 'prewitt', T, 'vertical');

[g3, t3] = edge(f, 'roberts', T, 'vertical');

sigma = 1;
[g4, t4] = edge(f, 'log', T, sigma);

% H = fspecial('sobel');
% [g5, t5] = edge(f, 'zerocross', T, H);
[g5, t5] = edge(f, 'zerocross');

[g6, t6] = edge(f, 'canny', T, 'vertical');

figure(1);
subplot(2, 3, 1), imshow(g1, []);
subplot(2, 3, 2), imshow(g2, []);
subplot(2, 3, 3), imshow(g3, []);
subplot(2, 3, 4), imshow(g4, []);
subplot(2, 3, 5), imshow(g5, []);
subplot(2, 3, 6), imshow(g6, []);
