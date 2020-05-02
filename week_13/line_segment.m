%
% line_segment.m
%

clear all;
close all;
clc;

f = imread('img/building.tif');

g_canny_best = edge(f, 'canny', [0.04 0.10], 1.5);
figure(1); imshow(g_canny_best);

[H, theta, rho] = hough(g_canny_best, 'RhoResolution', 0.5); 
figure(2);
imshow(H, [], 'XData', theta, 'YData', rho);
axis on, axis normal;
xlabel('\theta'), ylabel('\rho');

peak = houghpeaks(H, 15);
hold on;
plot(theta(peak(:,2)), rho(peak(:,1)), 's', 'color', 'w');

lines = houghlines(g_canny_best, theta, rho, peak);
figure(3); imshow(g_canny_best), hold on;

for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:, 2), xy(:, 1), 'LineWidth', 4, 'color', [.6 .6 .6]);
end
