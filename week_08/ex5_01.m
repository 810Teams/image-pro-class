% Generating Spatial Random Noise with a Specified Distribution

clear all;

f = imread('img/lena.bmp');
M = 256;
N = 256;
a = 0;
b = 1;
R = a + sqrt(b*log(1-rand(M, N)));     % Rayleigh CDF

figure(1), imshow(uint8(abs(R)), []);

%%

clear all;

C = [  0 64;
       0 128;
      32 32;  
      64 0;
     128 0;
     -32 32]
[r, R, S] = imnoise3(512, 512, C);

figure(2);
subplot(1, 2, 1), imshow(S, []);
subplot(1, 2, 2), imshow(r, []);

%%

clear all;

C = [  0 32;
       0 64;
      16 16;
      32 0;
      64 0;
     -16 16]
[r, R, S] = imnoise3(512, 512, C);

figure(3);
subplot(1, 2, 1), imshow(S, []);
subplot(1, 2, 2), imshow(r, []);

%%

clear all;

C = [  6 32;
      -2 2];

[r, R, S] = imnoise3(512, 512, C);

figure(4);
subplot(1, 2, 1), imshow(S, []);
subplot(1, 2, 2), imshow(r, []);

%%

clear all;

C = [1 5];

[r, R, S] = imnoise3(512, 512, C);

figure(5);
subplot(1, 2, 1), imshow(S, []);
subplot(1, 2, 2), imshow(r, []);
