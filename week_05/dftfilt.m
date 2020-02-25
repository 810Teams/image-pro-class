function g = dftfilt(f, H)
    F = fft2(f, size(H, 1), size(H, 2));
    G = H.*F;
    % figure, imshow(H, []); % for debugging
    % figure, imshow(uint8(abs(log(1 + F))), []); % for debugging
    g = real(ifft2(G));
    g = g(1:size(f,1), 1:size(f,2));






