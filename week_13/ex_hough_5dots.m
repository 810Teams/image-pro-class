%
% ex_hough_5dots.m
%

clear all;
close all;
clc;

f = zeros(101, 101);
f(1, 1) = 1;
f(101, 1) = 1;
f(1, 101) = 1;
f(101, 101) = 1;
f(51, 51) = 1;

[H, theta, rho] = hough(f);
figure(1);
subplot(1, 2, 1), imshow(H, []);
subplot(1, 2, 2), imshow(H, 'XData', theta, 'YData', rho);
axis on, axis normal;
xlabel('\theta'), ylabel('\rho');
