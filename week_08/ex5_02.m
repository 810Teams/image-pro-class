clear all;
close all;

f = imread('img/lena.bmp');

figure(1), imshow(f);
sz = size(f);

%C = [6 32];
C = [32 6];
[r, R, S] = imnoise3(sz(1), sz(2), C);
figure(2), imshow(r, []);
figure(3), imshow(S, []);

fn = (double(f) + (mat2gray(r).*255))./2;
figure(4), imshow(fn, []);

PQ = paddedsize(size(fn));
FN = fft2(fn, PQ(1), PQ(2));

FNs = fftshift(FN);
FNlog = log(1 + FNs);
figure(5), imshow(uint8(abs(FNlog)), []);

[H D] = notchfilt('notch', sz(1), sz(2), 5, 8);
H1 = fftshift(H);
figure(6), imshow(uint8(H1.*255), []);

g = dftfilt(fn, H);
figure(7), imshow(uint8(g), []);






