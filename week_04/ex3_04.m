%
% ex3_04.m
%

clear all;
close all;

%% 1.1

f = imread('img/Fig0306(a)(bone-scan-GE).tif');
w = [0.1 0.1 0.1;
     0.1 0.9 0.1;
     0.1 0.1 0.1];

afterfilter = conv2(double(f), w);
figure(1);
subplot(1,2,1); imshow(f);
subplot(1,2,2); imshow(uint8(afterfilter));

%% 1.2

lowresult1 = imfilter(double(f), w, 'conv', 'replicate');
lowresult2 = imfilter(double(f), w, 'corr', 'replicate');

figure(2);
subplot(2,2,1); imshow(f);
subplot(2,2,2); imshow(lowresult1);
subplot(2,2,3); imshow(lowresult2);

%% 2.1

hw = [1 1 1;
      1 -8 1;
      1 1 1];

hiresult = imfilter(double(f), hw, 'conv', 'replicate')

figure(3);
subplot(2, 2, 1); imshow(f);
subplot(2, 2, 2); imshow(uint8(lowresult1));
subplot(2, 2, 3); imshow(uint8(hiresult));

%% 2.2

white(1:50, 1:50) = 1;
black(1:50, 1:50) = 0;
blkwht = [black white; white black];

w5 = ones(5);
result1 = imfilter(double(blkwht), w5, 'conv');
result2 = imfilter(double(blkwht), w5, 'conv', 'replicate');
result3 = imfilter(double(blkwht), w5, 'conv', 'symmetric');
result4 = imfilter(double(blkwht), w5, 'conv', 'circular');

figure(4);
subplot(2,3,1); imshow(blkwht);
subplot(2,3,2); imshow(im2uint8(mat2gray(result1)));
subplot(2,3,3); imshow(im2uint8(mat2gray(result2)));
subplot(2,3,5); imshow(im2uint8(mat2gray(result3)));
subplot(2,3,6); imshow(im2uint8(mat2gray(result4)));


%% 3.1

f = imread('circuit.tif')

nonsf1 = ordfilt2(f, 1, ones(3));
nonsf2 = ordfilt2(f, 5, ones(3));
nonsf3 = ordfilt2(f, 9, ones(3));

figure(5);
subplot(2,2,1); imshow(f);
subplot(2,2,2); imshow(nonsf1);
subplot(2,2,3); imshow(nonsf2);
subplot(2,2,4); imshow(nonsf3);

%% 3.2

fn = imnoise(f, 'salt & pepper', 0.2);
mf3 = ordfilt2(fn, 5, ones(3));
mf5 = ordfilt2(fn, 13, ones(5));

mf6 = medfilt2(fn, [5 5], 'symmetric');

figure(6);
subplot(2,2,1); imshow(f);
subplot(2,2,2); imshow(fn);
subplot(2,2,3); imshow(mf3);
subplot(2,2,4); imshow(mf5);

figure(7); imshow(mf6);

%% 4.1

f = imread('img/lena.bmp');

w1 = fspecial('laplacian', 0);
w2 = fspecial('sobel');
w3 = fspecial('prewitt');

sf1 = imfilter(f, w1, 'conv');
sf2 = imfilter(f, w2, 'conv');
sf3 = imfilter(f, w3, 'conv');

figure(8);
subplot(2,2,1); imshow(f);
subplot(2,2,2); imshow(sf1);
subplot(2,2,3); imshow(sf2);
subplot(2,2,4); imshow(sf3);













