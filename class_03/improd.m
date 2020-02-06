function [p, pmax, pmin, pn] = improd(f, g)
    % IMPROD Summary of this function goes here
    %   Detailed explanation goes here
    %   Joking, I won't write any documentation. LEL
    fd = double(f);
    gd = double(g);
    p = fd.*gd;
    pmax = max(p(:));
    pmin = min(p(:));
    pn = mat2gray(p);
end
