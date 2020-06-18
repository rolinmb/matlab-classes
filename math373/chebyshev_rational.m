function [q,p,A] = chebyshev_rational(a, m, n)
% Chebyshev Rational Approximation f(x) = p(x)/q(x)
% p(x), q(x) are polynomials of degree n and m,

N = m + n;
A = zeros(N+1,N+2);
a = a(:);
A(2:end,1) = a(2:N+1);
a(2:end)   = a(2:end)/2;
A(1,1:m+1) = a(1:m+1)';

A(2:end,2:m+1)   = toeplitz(a(1:N),a(1:m)) + hankel(a(3:N+2),a(N+2:N+m+1));
A(1:n+1,m+2:N+2) = -eye(n+1);
x = -A(:,2:end)\A(:,1);
q = [1;x(1:m)];
p = x(m+1:m+n+1);

end
