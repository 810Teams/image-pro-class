%
% workshop.m
%

%% Workshop #1

% 1.1
img_lena = imread('lena.jpg');
figure(11), imshow(img_lena);

% 1.2
imwrite(img_lena, 'lena_jung.jpg');

% 1.3
img_lena_jung = imread('lena_jung.jpg');
imwrite(img_lena_jung, 'lena_jung_q5.jpg', 'quality', 5);

% 1.4
img_lena_jung = rgb2gray(img_lena_jung);
figure(14), imshow(img_lena_jung);

% 1.5
img_lena_jung = img_lena_jung(:, end:-1:1);
figure(15), imshow(img_lena_jung);

%% Workshop #2

[max_v, min_v, mean_v, b] = lenajung(img_lena_jung);
figure(20), imshow(b);

%% Workshop #3

sum = sum_intensity(img_lena_jung);

%% Workshop #4

img_lena = imread('lena.bmp');
img_lena = img_lena(51:206, 51:206);
figure(40), imshow(img_lena);

%% Workshop #5

img_lena = imread('lena.bmp');
img_lena = rot90(img_lena);
figure(50), imshow(img_lena);

%% Workshop #6

img_lena = imread('lena.bmp');
img_lena(1:end, 1:10) = 0;
img_lena(1:10, 1:end) = 0;
figure(60), imshow(img_lena);















