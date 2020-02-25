function [s] = lcsTrans(r)
    %LCSTRANS Summary of this function goes here
    %   Detailed explanation goes here
    s = r * 2/3

    if r > 97
        s = (s - lcsTrans(97)) * 3 + lcsTrans(97)
    end
    if r > 157
        s = (s - lcsTrans(157)) / 3 + lcsTrans(157)
    end
end

