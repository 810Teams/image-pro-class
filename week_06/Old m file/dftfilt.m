function g = dftfilt(f, H)
F = fft2(f, size(H,1), size(H,2));
G = H.*F;
% figure, imshow(H, []); % for debugging
% figure, imshow(uint8(abs(log(1 + F))), []); % for debugging
g = real(ifft2(G));
g = g(1:size(f,1), 1:size(f,2));
end

function [U, V] = dftuv(M, N)
% Set up range of variables.
u = 0:(M-1);
v = 0:(N-1);
% Compute the indices for use in meshgrid.
idx = find(u > M/2);
u(idx) = u(idx) - M;
idy = find(v > N/2);
v(idy) = v(idy) - N;
% Compute the meshgrid arrays.
[U, V] = meshgrid(v, u);
end

function [H, D] = lpfilter(type, M, N, D0, n)
%
% Use function dftuv to set up the meshgrid arrays needed for
% computing the required distances.
[U, V] = dftuv(M, N);
% Compute the distances D(U, V).
D = sqrt(U.^2 + V.^2);
% Begin filter computations.
switch type
    case 'ideal'
        H = double(D <= D0);
    case 'btw'
        if nargin == 4
            n = 1;
        end
        H = 1./(1 + (D./D0).^(2*n));
    case 'gaussian'
        H = exp(-(D.^2)./(2*(D0^2)));
    otherwise
        error('Unknown filter type');
    end
end