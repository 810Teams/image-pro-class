%
% script_04.m
%

%% Image reading

f = imread('lena.bmp');

%% Image displaying

fp = f(end:-1:1, :); % Row reversing (Flip)
figure, imshow(fp);

fc = f(100:180, 100:180); % Incomplete row and col (Cropping)
figure, imshow(fc);

fs = f(1:2:end, 1:2:end); % Row and col skipping (Resize)
figure, imshow(fs);

%% Size and dimensions

k = size(f, 0);
k = size(f, 1);
d = ndims(f);













