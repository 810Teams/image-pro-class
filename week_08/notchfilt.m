function [H, D] = notchfilt(type, M, N, D0, n)
%
% Use function dftuv to set up the meshgrid arrays needed for
% computing the required distances.
[U, V] = dftuv(M, N);

% Compute the distances D(U, V).
D = sqrt(U.^2 + V.^2);
s = 0.000000001;
% Begin filter computations.
switch type
    case 'notch'
        u0 = 32; 
        v0 = 6; 
        D1 = sqrt( ((U - u0).^2 ) + ((V - v0).^2) );
        D2 = sqrt( ((U + u0).^2 ) + ((V + v0).^2) );
        H = 1./(1 + ((D0.^2)./(s + D1.*D2)).^n);
    otherwise
        error('Unknown filter type.');
end
