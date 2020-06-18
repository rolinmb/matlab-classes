clear all
close all
format long

f = @(x) x^4-3*x^3 + x^2 + x + 1;

tol = 1e-5;
MaxIter = 100;

p0 = 0.5;
p1=-0.5;
p2=0;

[P F]=muller(f,p0,p1,p2,tol,MaxIter);
[P(:) F(:)]

%p0 = 0.5; p1=1.0; p2=1.5;
%[P F]=muller(f,p0,p1,p2,tol,MaxIter);
%[P(:) F(:)]

%p0 = 1.5; p1=2.0; p2=2.5;
%[P F]=muller(f,p0,p1,p2,tol,MaxIter);
%[P(:) F(:)]