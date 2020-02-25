%
% workshop
%

%% 1

clear all

f = [1 1 1 1 1 1 1 1;
     1 1 1 1 1 1 1 0;
     1 1 1 1 1 1 0 0;
     1 1 1 1 1 0 0 0;
     1 1 1 1 0 0 0 0;
     1 1 1 0 0 0 0 0;
     1 1 0 0 0 0 0 0;
     1 0 0 0 0 0 0 0];

w = [-1 -1 -1;
     -1 8 -1;
     -1 -1 -1];
 
f_padding = zeros(12);

for i = 1:12
    for j = 1:12
        if i < 3 || i > 10 || j < 3 || j > 10
            f_padding(i, j) = 0;
        else
            f_padding(i, j) = f(i - 2, j - 2);
        end
    end
end

clear i
clear j

g = zeros(12);

for i = 3:10
    for j = 3:10
        g(i, j) = f_padding(i - 1, j - 1) * w(1, 1);
        g(i, j) = g(i, j) + f_padding(i - 1, j + 0) * w(1, 2);
        g(i, j) = g(i, j) + f_padding(i - 1, j + 1) * w(1, 3);
        g(i, j) = g(i, j) + f_padding(i + 0, j - 1) * w(2, 1);
        g(i, j) = g(i, j) + f_padding(i + 0, j + 0) * w(2, 2);
        g(i, j) = g(i, j) + f_padding(i + 0, j + 1) * w(2, 3);
        g(i, j) = g(i, j) + f_padding(i + 1, j - 1) * w(3, 1);
        g(i, j) = g(i, j) + f_padding(i + 1, j + 0) * w(3, 2);
        g(i, j) = g(i, j) + f_padding(i + 1, j + 1) * w(3, 3);
    end
end

%% 2

image = myFunction(imread('img/lena.bmp'), w);
figure; imshow(image);













