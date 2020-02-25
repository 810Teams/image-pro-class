for x1 = 1:10
    f1(x1) = 2 * sin((x1 - 1) / (2 * pi));
end
clear x1

x = 0:10-1;
f = 2 * sin(x / (2 * pi));