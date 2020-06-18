
n=3;


% least square apporoximation 
% with trig poly

% Choose function
f = @(x) exp(x);
%f = @(x) exp(sin(x));
%f = @(x) (sin(x));
%f = @(x) abs(x);

a=zeros(n,1);
b=zeros(n,1);
for k=1:n
    a(k) = quad( @(x) f(x).*cos(k*x), -pi, pi, 1e-10) / pi;
    b(k) = quad( @(x) f(x).*sin(k*x), -pi, pi, 1e-10) / pi;
end
a0 = quad( @(x) f(x), -pi, pi, 1e-12) / pi;

x = linspace(-pi,pi,1000)';
k = 1:n;
S = a0/2 + cos(x*k)*a + sin(x*k(1:n-1))*b(1:n-1);

a
b

plot(x,S,'bo',x,f(x),'r')
