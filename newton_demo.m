clear all
close all

format long


%HW 1 Question 4; f(x) = 4x^2 - e^(x) - e^(-x)
f = @(x) 4*x^2 - exp(x) - exp(-x);
df = @(x) 8*x - exp(x) + exp(-x);

tol = 1e-5;
MaxIter = 100;
p0 = 10

[P F] = newton(f,df,p0,tol,MaxIter);

[P(:) F(:)]