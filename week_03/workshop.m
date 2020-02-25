%
% workshop.m
%

clear all;

f = imread('img/Fig0303(a)(breast).tif')
g = imread('img/Fig0303(a)(breast).tif') 

for i = 1:570
    for j = 1:482
        [s] = lcsTrans(f(i, j));
        g(i, j) = s;
    end
end

figure(1), imshow(f);
figure(2), imshow(g);
