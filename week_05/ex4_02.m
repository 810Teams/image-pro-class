%
% ex4_02.m
%

up = ones(128, 256);
low = zeros(128, 256);
bw = [up; low];
figure(1); imshow(bw);

[M, N] = size(bw);
BW = fft2(bw);
sig = 10;
H = lpfilter('gaussian', M, N, sig);
G = H.*BW;
g = real(ifft2(G));
figure(2); imshow(g, []);

PQ = paddedsize(size(bw));
BW1 = fft2(bw, PQ(1), PQ(2));
sig = 10;
H1 = lpfilter('gaussian', PQ(1), PQ(2), 2 * sig);

G1 = H1.*BW1;
g1 = real(ifft2(G1));
figure(3); imshow(g1, []);

gc1 = g1(1:size(bw, 1), 1:size(bw,2));
figure(4); imshow(gc1, []);
