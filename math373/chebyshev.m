function y = chebyshev(n, x)

y = ones(numel(x),1)*[1,zeros(1,n)];
if n>=1
  y(:,2)=x(:);
end
for ii=1:n-1
  y(:,ii+2)=2*x(:).*y(:,ii+1)-y(:,ii);
end
