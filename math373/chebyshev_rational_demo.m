%%%%%%%%%%%%%%%%%
% Chebyshev Rational Approximation f(x) = p(x)/q(x)
% p(x), q(x) are polynomials of degree n and m,
%%%%%%%%%%%%%%%%%
close all

f=@(x) exp(-x);

n = 0;
m = 2;
NN = n + 2*m + 1;

%chebyshev expansion
a = zeros(NN,1);
for k = 1:NN
   a(k) = quad( @(theta) f(cos(theta)).*cos((k-1)*theta), 0, pi, 1e-12) / pi;
end
a(2:end) = 2*a(2:end);

if m == 0
    xx = (-1:0.01:1)';
    rr = (chebyshev(n,xx)*a(:));
    ee = f(xx) - rr; 
    
    plot(xx,f(xx),'r', xx,rr,'bo')
    norm(ee,inf)
    return
end

%pade chebyshev approximation
[q,p,A] = chebyshev_rational(a,m,n)
xx = (-1:0.01:1)';
rr = (chebyshev(n,xx)*p) ./ (chebyshev(m,xx)*q);
ee = f(xx) - rr; 

plot(xx,f(xx),'r', xx,rr,'bo')
norm(ee,inf)
