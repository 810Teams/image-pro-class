function [r, R, S] = imnoise3(M, N, C, A, B)
% IMNOISE3 generates periodic noise.

% Process input parameters.
[K, n] = size(C);
if nargin == 3
    A(1:K) = 1.0;
    B(1:K, 1:2) = 0;
elseif nargin == 4 
    B(1:K, 1:2) = 0;
end

% Generate R.
R = zeros(M, N);
for j = 1:K
    u1 = M/2 + 1 + C(j, 1); v1 = N/2 + 1 + C(j, 2);
    R(u1, v1) = i * (A(j)/2) * exp(i*2*pi*C(j, 1) * B(j, 1)/M);
    % Complex conjugate.
    u2 = M/2 + 1 - C(j, 1); v2 = N/2 + 1 - C(j, 2);
    R(u2, v2) = -i * (A(j)/2) * exp(i*2*pi*C(j, 1) * B(j, 1)/N);
end

% Compute spectrum and spatial sinusoidal pattern.
S = abs(R);
r = real(ifft2(ifftshift(R)));

    