%
% script_01.m
% Global Thresholding
%

clear all;
close all;
clc;

f = imread('img/rice.tif');
T = 0.5 * (double(min(f(:))) + double(max(f(:))));
done = false;

while ~done
    g = f >= T;
    Tnext = 0.5 * (mean(f(g)) + mean(f(~g)));
    done = abs(T - Tnext) < 0.5;
    T = Tnext;
end

To = graythresh(f) * 255;
T, To
