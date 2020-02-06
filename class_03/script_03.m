%
% script_03.m
%

%%

clear all

%%

f = [-0.5 0.5; 0.75 1.5];
g = im2uint8(f); % scaling to unsigned int8 [0, 255]
g1 = mat2gray(f); % scaling to unsigned double          % mat2gray(f, [fmin, fmax])

%% 

h = uint8([25 50; 128 200]);
g2 = im2double(h); % scaling to double

%%

clear all

%%

f = [1 2; 3 4];
g = mat2gray(f);
gb = im2bw(g, 0.6);
gb1 = f > 2;
gbv = islogical(gb);

%%

gbd = im2double(gb);
gbd1 = im2double(im2bw(mat2gray(f), 0.6));
gbd2 = double(f > 2);






