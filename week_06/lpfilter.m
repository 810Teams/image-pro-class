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
