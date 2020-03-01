%
% script_03.m
%

%%

clear all;

%%

f = [-0.5 0.5; 0.75 1.5];
g = im2uint8(f); % scaling to unsigned int8 with [0, 255] as min-max
g1 = mat2gray(f); % scaling to double with auto min-max

%% 

h = uint8([25 50; 128 200]);
g2 = im2double(h); % scaling to double with [0, 1] as min-max

%%

clear all;

%%

f = [1 2; 3 4];
g = mat2gray(f);
gb = imbinarize(g, 0.6);
gb1 = f > 2;
gbv = islogical(gb);

%%

gbd = im2double(gb);
gbd1 = im2double(imbinarize(mat2gray(f), 0.6));
gbd2 = double(f > 2);
