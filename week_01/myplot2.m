t = -pi:pi/100:pi;
y = sin(t);
plot(t, y);
axis([-pi pi -1 1]);
xlabel('-\pi \leq {\itt} \leq \pi');
ylabel('\sin(t)');
title('Graph of the sine function');
text(-3, 0.8, '\it{Note the odd symmetry.}');