f = imread('lena.bmp');

h1 = [-1 -1 -1;
    -1 8 -1;
    -1 -1 -1]
figure(1);
freqz2(h1);

h2 = [1 1 1;
    1 -8 1;
    1 1 1]
figure(2);
freqz2(h2);

h3 = [1 1 0;
    1 0 1;
    0 1 1]
figure(3);
freqz2(h3);

h4 = [-1 0 -1 0 -1;
    0 0 0 0 0;
    -1 0 8 0 -1;
    0 0 0 0 0;
    -1 0 -1 0 -1]
figure(4);
freqz2(h4);

F1 = imfilter(double(f), h1);

F2 = imfilter(double(f), h2);

F3 = imfilter(double(f), h3);

F4 = imfilter(double(f), h4);

figure(5);
subplot(2, 2 ,1); imshow(F1, []);
subplot(2, 2 ,2); imshow(F2, []);
subplot(2, 2 ,3); imshow(F3, []);
subplot(2, 2 ,4); imshow(F4, []);



