function [max_v, min_v, mean_v, b] = lenajung(img)
%LENAJUNG Summary of this function goes here
%   Detailed explanation goes here
    max_v = max(max(img));
    min_v = min(min(img));
    mean_v = mean(mean(img));
    b = imbinarize(img);
end
