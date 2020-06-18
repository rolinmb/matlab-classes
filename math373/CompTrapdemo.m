clear all
close all
format long

f = @(x) x^4;
a = 0.5;
b = 1.0;
n = 4;
h = (b-a)/n;

val = 0;
val = val + f(a);
for i = 1:n-1
   val = val + 2*f(a+h*i); 
end
val = val + f(b);

%The value for Part (e) regarding Part (c)
val = (h/2)*val
%Verification for Part (f)
partf = CompositeTrapezoidalRule(f,a,b,n)