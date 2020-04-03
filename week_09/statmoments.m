function [v, unv] = statmoments(p, n)
% Statmoments computes statistical central moments of image histogram

Lp = length(p);
if (Lp ~= 256) & (Lp ~= 65536)
    error('P must be a 256- or 65536-element vector.')
end

G = Lp - 1;
% Make sure the histogram has unit area, and convert it to a column vector.
p = p/sum(p); p = p(:);

% Form a vector of all the posible values of the random variable.
z = 0:G

% Now normalize the z's to the range [0, 1].
z = z./G;

% The mean.
m = z*p;

% Center ramdom variables about the mean.
z = z - m;

% Compute the centrol moments.
v = zeros(1, n);
v(1) = m;
for j = 2:n
    v(j) = (z.^j)*p;
end

if nargout > 1
    % Compute the uncentralized moments.
    unv = zeros(1, n);
    unv(1) = m.*G;
    for j = 2:n
        unv(j) = ((z*G).^j)*p;
    end
end
