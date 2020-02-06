%
% script_01.m
%

%% Image reading

img_tif = imread('dipum_images_ch01/Fig0101(MATLAB_desktop_with_text).tif');
img_bmp = imread('lena.bmp');
img_jpg = imread('lena.jpg');

%% Image displaying

imshow(img_bmp);
figure(1), imshow(img_bmp, [])

%% Image saving

imwrite(img_bmp, 'new_img_01/patient10.tif');
