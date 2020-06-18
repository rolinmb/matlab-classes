n=4;
m=6;

% discrete least square apporoximation 
% with trig poly

% Choose function
%f = @(x) x;
f = @(x) exp(x);
%f = @(x) abs(x);

x=-pi+(0:2*m-1)'/m*pi;
y=f(x);

a=zeros(n,1);
b=zeros(n,1);
for k=1:n
    a(k) = y'*cos(k*x)/m;
    b(k) = y'*sin(k*x)/m;
end
a0 = sum(y)/m;

x = linspace(-pi,pi,50)';
k = 1:n;
S = a0/2 + cos(x*k)*a + sin(x*k(1:n-1))*b(1:n-1);

a
b

plot(x,S,'bo', x,f(x),'r')
