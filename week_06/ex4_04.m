% Generating Filters Directly in the Frequency Domain

f = imread('lena.bmp');

PQ = paddedsize(size(f));
[U, V] = dftuv(PQ(1), PQ(2));

D0 = 0.1*PQ(2);     
% 0.2 : Radian of the filter
F = fft2(f, PQ(1), PQ(2));      
% Converting f to frequency domain with zero padding

%H = exp(-(U.^2 + V.^2 / (2 * (D0^2)));
% A filter on frequency domain

D = sqrt(U.^2 + V.^2);
H = double(D <= D0);
g = dftfilt(f, H);
% Performing on frequncy domain

figure(1);
subplot(2, 2, 1); imshow(f);
subplot(2, 2, 2); imshow(fftshift(H));
subplot(2, 2, 3); imshow(log(1 + abs(fftshift(F))), []);
subplot(2, 2, 4); imshow(g, []);

figure(2);
mesh(fftshift(H(1:10:512, 1:10:512)));

