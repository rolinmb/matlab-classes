clear all
close all

format long

%Multiplicity of zeros > 1
%Define function and it's derivatives to be used in Newton's
f = @(x) 1 - (4*(x*cos(x))) + (2*(x^2)) + cos(2*x);
df = @(x) (4*(x*sin(x))) - (4*cos(x)) - (2*sin(2*x)) + (4*x);
ddf = @(x) (4*(x*cos(x))) + (8*sin(x)) - (4*cos(2*x)) + 4;

%Function to be used in Modified Newton's(FPIteration)
g = @(x) x - f(x)*df(x)/(df(x)*df(x)-f(x)*ddf(x));

tol = 1e-5;
MaxIter = 100;

%Call functions
[P F] = newton(f, df, 1.0, tol, MaxIter);
[P2 F2] = fixedpoint(g, 1.0, tol, MaxIter);

%Format output
[P(:) F(:)]
[P2(:) F2(:) F2(:) - P2(:)]