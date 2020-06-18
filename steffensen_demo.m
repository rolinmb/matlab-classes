clear all
close all

format long

%f = @(x) x^3+4*x^2-10 ;
g = @(x) 0.5*sqrt(10-x^3);
%g = @(x) sqrt(10/(4+x)); 

tol = 1e-6;
MaxIter = 100;

[P G] = fixedpoint(g, 1.5, tol, MaxIter);
[P2 G2] = steffensen(g, 1.5, tol, MaxIter);

[P(:) G(:) G(:) - P(:)]
[P2(:) G2(:) G2(:) - P2(:)] 