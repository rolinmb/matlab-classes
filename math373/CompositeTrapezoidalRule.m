function v = CompositeTrapezoidalRule(f,a,b,n)
    h = (b-a)/n;
    %Initialize total to 0
    v = 0;
    %Use f(a)
    v = v + f(a);
    %Calculating the sums over the n-subintervals
    for i = 1:n-1
        v = v + 2*f(a+h*i);
    end
    v = v + f(b);
    v = (h/2)*v;
end