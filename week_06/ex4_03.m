% Obtaining Frequency Domain Filter from Spatial Filters

f = imread('lena.bmp');
%f = imread('building.tif');

F = fft2(f);
S = fftshift(log(1 + abs(F)));
S = gscale(S);
figure(2);
imshow(S, []);

h = fspecial('sobel')';
figure(3);
freqz2(h);

PQ = paddedsize(size(f));
H = freqz2(h, PQ(1), PQ(2));
H1 = ifftshift(H);
figure(4);
imshow(abs(H), []);

gs = imfilter(double(f), h); % Performing on spatial domain
gf = dftfilt(f, H1); % Performing on frequency domain

figure(5);
subplot(2, 2, 1); imshow(gs, []);
subplot(2, 2, 2); imshow(gf, []);
subplot(2, 2, 3); imshow(abs(gs), []);
subplot(2, 2, 4); imshow(abs(gf), []);

figure(6);
subplot(1, 2, 1); imshow(gs > 0.2*abs(max(gs(:))));
subplot(1, 2, 2); imshow(gf > 0.2*abs(max(gf(:))));

d = abs(gs - gf);
max(d(:))
min(d(:))
