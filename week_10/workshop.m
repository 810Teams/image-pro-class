%
% workshop.m
%

clear all;
close all;

% Image
f = imread('img/broken_text.tif');

% Structuring elements
se1 = strel('disk', 1);
se2 = strel('disk', 3);
se3 = strel('square', 2);

% imdilate
dlt1 = imdilate(f, se1);
dlt2 = imdilate(f, se2);
dlt3 = imdilate(f, se3);

% imerode
erd1 = imerode(f, se1);
erd2 = imerode(f, se2);
erd3 = imerode(f, se3);

% imopen
imop1 = imopen(f, se1);
imop2 = imopen(f, se2);
imop3 = imopen(f, se3);

% imclose
imcl1 = imclose(f, se1);
imcl2 = imclose(f, se2);
imcl3 = imclose(f, se3);

% display
figure(1);
subplot(4, 3, 1), imshow(dlt1);
subplot(4, 3, 2), imshow(dlt2);
subplot(4, 3, 3), imshow(dlt3);
subplot(4, 3, 4), imshow(erd1);
subplot(4, 3, 5), imshow(erd2);
subplot(4, 3, 6), imshow(erd3);
subplot(4, 3, 7), imshow(imop1);
subplot(4, 3, 8), imshow(imop2);
subplot(4, 3, 9), imshow(imop3);
subplot(4, 3, 10), imshow(imcl1);
subplot(4, 3, 11), imshow(imcl2);
subplot(4, 3, 12), imshow(imcl3);
