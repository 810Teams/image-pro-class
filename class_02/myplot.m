t = 0:pi/100:2*pi;
y = sin(t);
y2 = sin(t + 0.25);
y3 = sin(t + 0.5);
plot(t, y, t, y2, t, y3);