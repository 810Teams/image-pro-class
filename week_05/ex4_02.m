%
% ex4_02.m
%

clear all;
close all;

% Image creation
up = ones(128, 256);
low = zeros(128, 256);
bw = [up; low];
figure(1);
subplot(2, 2, 1); imshow(bw);

% Apply gaussian filtering
[M, N] = size(bw);
BW = fft2(bw);
sig = 10; % Blurness, closer to 0, more blurry the image is going to be.
H = lpfilter('gaussian', M, N, sig);
G = H .* BW;
g = real(ifft2(G));
subplot(2, 2, 2); imshow(g, []);

% Padding
PQ = paddedsize(size(bw));
BW1 = fft2(bw, PQ(1), PQ(2));
sig = 10;
H1 = lpfilter('gaussian', PQ(1), PQ(2), 2 * sig);

G1 = H1 .* BW1;
g1 = real(ifft2(G1));
subplot(2, 2, 3); imshow(g1, []);

gc1 = g1(1:size(bw, 1), 1:size(bw,2));
subplot(2, 2, 4); imshow(gc1, []);
