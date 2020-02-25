%
% workshop.m
%

clear all;

% Transform pixel-by-pixel with written function `lcsTrans` (see `lcsTrans.m`)
img = imread('img/Fig0303(a)(breast).tif');
img_new = imread('img/Fig0303(a)(breast).tif') ;

for i = 1:length(img)
    for j = 1:length(img(1, :))
        img_new(i, j) = lcsTrans(img(i, j));
    end
end

% Display shifted line
figure(1);
line = 0:255;

for i = 1:256
    line(i) = lcsTrans(i - 1);
end

plot(line)

% Display transformed image 
figure(2);
subplot(1, 2, 1); imshow(img);
subplot(1, 2, 2); imshow(img_new);
