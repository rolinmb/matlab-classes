clear all
close all

format long

f = @(x) x^3+4*x^2-10;
tol = 1e-6;
MaxIter = 100;

[P F A B] = bisection(f, 1, 2, tol, MaxIter); 
[A(:) B(:) P(:) F(:)]

%[P(:)-P(end) 2./(2.^([1:length(P)]'))]
%10/log10(2) 

log10(1/1e-10)/log10(2)