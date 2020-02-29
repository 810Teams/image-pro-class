%
% workshop
%

%% Workshop #1

clear all;

% Original matrix
f = [1 1 1 1 1 1 1 1;
     1 1 1 1 1 1 1 0;
     1 1 1 1 1 1 0 0;
     1 1 1 1 1 0 0 0;
     1 1 1 1 0 0 0 0;
     1 1 1 0 0 0 0 0;
     1 1 0 0 0 0 0 0;
     1 0 0 0 0 0 0 0];

% Filter matrix
w = [-1 -1 -1;
     -1  8 -1;
     -1 -1 -1];

% Padded matrix `f`
f_padding = zeros(12);
f_padding(3:10, 3:10) = f;

% Convoluted matrix (result)
g = zeros(8);

for i = 3:10
    for j = 3:10
        g(i - 2, j - 2) = g(i - 2, j - 2) + f_padding(i - 1, j - 1) * w(1, 1); % Cell: Upper Left
        g(i - 2, j - 2) = g(i - 2, j - 2) + f_padding(i - 1, j + 0) * w(1, 2); % Cell: Upper
        g(i - 2, j - 2) = g(i - 2, j - 2) + f_padding(i - 1, j + 1) * w(1, 3); % Cell: Upper Right
        g(i - 2, j - 2) = g(i - 2, j - 2) + f_padding(i + 0, j - 1) * w(2, 1); % Cell: Left
        g(i - 2, j - 2) = g(i - 2, j - 2) + f_padding(i + 0, j + 0) * w(2, 2); % Cell: Middle
        g(i - 2, j - 2) = g(i - 2, j - 2) + f_padding(i + 0, j + 1) * w(2, 3); % Cell: Right
        g(i - 2, j - 2) = g(i - 2, j - 2) + f_padding(i + 1, j - 1) * w(3, 1); % Cell: Lower Left
        g(i - 2, j - 2) = g(i - 2, j - 2) + f_padding(i + 1, j + 0) * w(3, 2); % Cell: Lower
        g(i - 2, j - 2) = g(i - 2, j - 2) + f_padding(i + 1, j + 1) * w(3, 3); % Cell: Lower Right
    end
end

clear i;
clear j;

%% Workshop #2

clear all;

% Original matrix
f = [1 1 1 1 1 1 1 1;
     1 1 1 1 1 1 1 0;
     1 1 1 1 1 1 0 0;
     1 1 1 1 1 0 0 0;
     1 1 1 1 0 0 0 0;
     1 1 1 0 0 0 0 0;
     1 1 0 0 0 0 0 0;
     1 0 0 0 0 0 0 0];

% Filter matrix
w = [-1 -1 -1;
     -1  8 -1;
     -1 -1 -1];

% Apply convolution filtering
g = imfilter(f, w);

%% Workshop #3

clear all;

% Filter matrix
w = [-1 -1 -1;
     -1  8 -1;
     -1 -1 -1];

image = myFunction(imread('img/lena.bmp'), w);
figure; imshow(image);
