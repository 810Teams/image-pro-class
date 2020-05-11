% Plotting highpass filters

clear all;
close all;

f = imread('lena.bmp');

PQ = paddedsize(size(f));
D0 = 0.005*PQ(1);

HBW = hpfilter('gaussian', PQ(1), PQ(2), D0, 2);
H = 0.9 + 10* HBW;

gbw = dftfilt(double(f), HBW);
gbw1 = gscale(gbw);
ghf = dftfilt(double(f), H);
ghf1 = gscale(ghf);
ghe = histeq(ghf1, 256);

figure(1); imshow(f, []);
figure(2); imshow(gbw1, []);
figure(3); imshow(ghf1, []);
figure(4); imshow(ghe, []);
