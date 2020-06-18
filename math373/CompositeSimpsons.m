function v = CompositeSimpsons(f,a,b,n)
    %Handle if n is odd or zero
    if~(mod(n,2)==0)
       'error: n is not even'
       v = NaN;
       return
    end
    
    h = (b-a)/n;
    %Initialize total value to return to 0
    v = 0;
    %Use f(a)
    v = v + f(a);
    %omputing sums of even nodes x(2i)
    for i = 2:2:(n-2)
        v = v + 2*f(a+h*i);
    end
    %Computing sums of odd nodes X(2i-1)
    for i = 1:2:(n-1)
        v = v + 4*f(a+h*i); 
    end
    %Use f(b)
    v = v + f(b);
    v = (h/3)*v;
end