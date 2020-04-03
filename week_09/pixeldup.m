function B = pixeldup(A, m, n)
% PIXELDUP duplicates pixels of an image in both direction. 
%   B = PIXELDUP(A, M, N) duplicate each pixel of A M times in the vertical
%   direction and N times in the horizontal direction. Parameters M and N
%   must be integers. If N is not included, it defualts to M.

% Check inputs
if nargin < 2
    error('At least two inputs are required.')
end
if nargin == 2
    n = m;
end

% Generate a vector with elements 1:size(A,1).
u = 1:size(A,1);

% Duplicate each element of the vector m times.
m = round(m);   % Protect against nonintegers.
u = u(ones(1, m), :);
u = u(:);

% Now repeat for the other direction.
v = 1:size(A, 2);
n = round(n);
v = v(ones(1, n), :);
v = v(:);
B = A(u, v);
