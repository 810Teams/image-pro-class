%
% script_02.m
% Erosion: MATLAB sample (1D Case)
%

clear all;
close all;

w = 0:2 * pi / 20:2 * pi;
y = 5 * sin(w);
se = [1 1 1 1 1];
ye = imerode(y, se);
plot(y);
hold on;
plot(ye, '-r');
