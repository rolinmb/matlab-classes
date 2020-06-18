clear all
close all


f = @(x) cos(x) - x;
df = @(x) -sin(x) - 1;

g = @(x) cos(x);

tol = 1e-6;
MaxIter = 100;

[P F] = newton(f, df, pi/4, tol, MaxIter);
[P2 F2] = fixedpoint(g, pi/4, tol, MaxIter);
[P3 F3] = secant(f, 0.5, pi/4, tol, MaxIter);

[P(:) F(:)]
[P2(:) F2(:) F2(:) - P2(:)]
[P3(:) F3(:)]