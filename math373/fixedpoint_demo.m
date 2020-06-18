clear all
close all

format long

%f = @(x) x^3+4*x^2-10 ;
%g = @(x) x - (x^3+4*x^2-10);
%g = @(x) sqrt(10/x-4*x);
%g = @(x) 0.5*sqrt(10-x^3);
%g = @(x) sqrt(10/(4+x));
g = @(x) x - (x^3+4*x^2-10)/(3*x^2+8*x);

tol = 1e-6;
MaxIter = 100;

[P G] = fixedpoint(g, 1.5, tol, MaxIter);
[P(:) G(:) G(:) - P(:)]