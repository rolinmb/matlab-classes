function [P F] = newton(f, df, p0, tol, MaxIter)

P = [p0];
F = [f(p0)];
iter = 0;
while 1
    iter = iter + 1;
    if iter>MaxIter
        break;
    end
    
    p = p0 - f(p0)/df(p0);
    
    P = [P p];
    F = [F f(p)];
    
    if abs(p-p0)<tol
        break;
    end
    
    p0 = p;
    
end
end