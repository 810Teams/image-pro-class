%
% script_02.m
%

%% Initialize

clear all;
N = [50 25 15 5 0];

%% Image reading

img = imread('dipum_images_ch02/Fig0204(a)(bubbles-q-100jpg).tif');

%% Image writing

for i = 1 : length(N)
    imwrite(img, sprintf('new_img_02/bubbles%d.jpg', N(i)), 'quality', N(i));
end
clear i

%% Image reading

img50 = imread('new_img_02/bubbles50.jpg');
img25 = imread('new_img_02/bubbles25.jpg');
img15 = imread('new_img_02/bubbles15.jpg');
img5 = imread('new_img_02/bubbles5.jpg');
img0 = imread('new_img_02/bubbles0.jpg');

%% Image display

if 0
    figure, imshow(img50);
    figure, imshow(img25);
    figure, imshow(img15);
    figure, imshow(img5);
    figure, imshow(img0);
end

%% Image information viewing

img_info = imfinfo('new_img_02/bubbles5.jpg');
img_bytes = img_info.Width * img_info.Height * img_info.BitDepth/8;
