function [res] = myFunction(f, w)
%MYFUNCTION Summary of this function goes here
%   Detailed explanation goes here
    res = imfilter(double(f), w, 'conv', 'replicate');
end

