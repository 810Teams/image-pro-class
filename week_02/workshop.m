%
% workshop.m
%

%% Workshop #1

clear all;

% 1.1
% Load `lena.jpg` and display
img_lena = imread('lena.jpg');
figure(1);
subplot(1, 3, 1), imshow(img_lena);

% 1.2
% Write `lena.jpg` as a new image named `lena_jung.jpg`
imwrite(img_lena, 'lena_jung.jpg');

% 1.3
% Write `lena.jpg` as a new image named `lena_q5.jpg` with 5% quality
imwrite(img_lena, 'lena_q5.jpg', 'quality', 5);

% 1.4
img_lena = rgb2gray(img_lena);
subplot(1, 3, 2), imshow(img_lena);

% 1.5
img_lena = img_lena(:, end:-1:1);
subplot(1, 3, 3), imshow(img_lena);

%% Workshop #2

% 2.1
% Call written function `lenajung` (see `lenajung.m`)
% Obtain max, min, mean, and a binarized image
[max_v, min_v, mean_v, b] = lenajung(img_lena);
figure(2), imshow(b);

%% Workshop #3

clear all;

% 3.1
% Call written function `sum_intensity` (see `sum_intensity.m`)
% Obtain summed intensity value of a grayscale image
sum = sum_intensity(imread('lena.bmp'));
sum;

%% Workshop #4

clear all;

% 4.1
% Crop `lena.bmp` by 25 pixels each side
img_lena = imread('lena.bmp');
img_lena_cropped = img_lena(51:206, 51:206);

figure(4);
subplot(1, 2, 1), imshow(img_lena);
subplot(1, 2, 2), imshow(img_lena_cropped);

%% Workshop #5

clear all;

% 5.1
% Rotate `lena.bmp` by 90 degrees anti-clockwise
img_lena = imread('lena.bmp');
img_lena_rotated = rot90(img_lena);

figure(5);
subplot(1, 2, 1), imshow(img_lena);
subplot(1, 2, 2), imshow(img_lena_rotated);

%% Workshop #6

clear all;

% 6.1
% Add 10-pixel thick black frame to `lena.bmp`
img_lena = imread('lena.bmp');
img_lena_frame = uint8(zeros(276, 276));
img_lena_frame(11:266, 11:266) = img_lena;

figure(6);
subplot(1, 2, 1), imshow(img_lena);
subplot(1, 2, 2), imshow(img_lena_frame);

%% Workshop #7

clear all;

% 7.1
% Split `lena.bmp` horizontally, then switch places
img_lena = imread('lena.bmp');
img_lena_new = uint8(zeros(256, 256));
img_lena_new(1:128, :) = img_lena(129:256, :);
img_lena_new(129:256, :) = img_lena(1:128, :);

figure(7);
subplot(1, 2, 1), imshow(img_lena);
subplot(1, 2, 2), imshow(img_lena_new);

%% Workshop #8

clear all;

% 8.1
% Split `lena.bmp` into 4 square parts, then switch places diagonally
img_lena = imread('lena.bmp');
img_lena_new = uint8(zeros(256, 256));
img_lena_new(1:128, 1:128) = img_lena(129:256, 129:256);
img_lena_new(1:128, 129:256) = img_lena(129:256, 1:128);
img_lena_new(129:256, 1:128) = img_lena(1:128, 129:256);
img_lena_new(129:256, 129:256) = img_lena(1:128, 1:128);

figure(8);
subplot(1, 2, 1), imshow(img_lena);
subplot(1, 2, 2), imshow(img_lena_new);

%% Workshop #9

clear all;

% 9.1
% Turn the center of `lena.bmp` into white
img_lena = imread('lena.bmp');
img_lena_new = img_lena;
img_lena_new(65:192, 65:192) = 255;

figure(9);
subplot(1, 2, 1), imshow(img_lena);
subplot(1, 2, 2), imshow(img_lena_new);

%% Workshop #10

clear all;

% 10.1
% Binarize `lena.bmp` with 0.6 gamma (0 all white, 1 all black)
img_lena = imread('lena.bmp');
img_lena_new = imbinarize(img_lena, 0.6);

figure(10);
subplot(1, 2, 1), imshow(img_lena);
subplot(1, 2, 2), imshow(img_lena_new);
