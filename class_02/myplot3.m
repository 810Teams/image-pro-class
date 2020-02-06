[X,Y] = meshgrid(-24:.5:24);
R = sqrt(X.^2 + Y.^2) + eps;
Z = sin(R)./R;
mesh(X, Y, Z);