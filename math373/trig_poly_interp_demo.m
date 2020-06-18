n=2^3;
m=n;

f = @(x) exp(x);

%data at 2m points
x=-pi+(0:2*m-1)'/m*pi;
y=f(x);


%direct computation with formula
tic;
a=zeros(n,1);
b=zeros(n,1);
for k=1:n
    a(k) = y'*cos(k*x)/m;
    b(k) = y'*sin(k*x)/m;
end
a0 = sum(y)/m;

a
b

x = linspace(-pi,pi,1000)';
k = 1:n; 
S = a0/2 + a(n)/2*cos(n*x) + cos(x*k(1:n-1))*a(1:n-1) + sin(x*k)*b;
toc;


%use FFT (ifft function in matlab)
tic;
c = ifft(y)*(2*m);
cc = ((-1).^([0:m]')/m).*c(1:m+1);
aa = real(cc);
bb = imag(cc);

aa0 = aa(1);
aa = aa(2:end);
bb=bb(2:end);

SS = aa0/2 + aa(n)/2*cos(n*x) + cos(x*k(1:n-1))*aa(1:n-1) + sin(x*k(1:n-1))*bb(1:n-1);
toc;

%return 

plot(x,S,'bo',x,f(x),'r',x,SS,'g*')
