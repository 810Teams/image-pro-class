%
% ex03_03.m
%

clear all;
close all;

%%

f = imread('img/Fig0308(a)(pollen).tif');
figure(1), imshow(f);
figure(2), imhist(f);
ylim('auto');

g = histeq(f, 256);
figure(3), imshow(g);
figure(4), imhist(g);
ylim('auto');

%%

hnorm = imhist(f) ./ numel(f);
cdf = cumsum(hnorm);
x = linspace(0, 1, 256);

figure(5);
plot(x, cdf);
axis([0 1 0 1]);
set(gca, 'xtick', 0:0.2:1);
set(gca, 'ytick', 0:0.2:1);
xlabel('Input intensity values', 'fontsize', 9);
xlabel('Output intensity values', 'fontsize', 9);
text(0.18, 0.5, 'Transformation function', 'fontsize', 9);















