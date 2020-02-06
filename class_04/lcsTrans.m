function [s] = lcsTrans(r)
    %LCSTRANS Summary of this function goes here
    %   Detailed explanation goes here
    if 97 < r && r < 158
        s = 2 * (r - 128) + 128;
    end
	if r <= 97
        s = 2 * r / 3;
    end
	if 158 <= r
        s = r + (255 - r)/ 3
    end
end

