function [P F] = secant(f, p0, p1, tol, MaxIter)

P = [p0 p1];
F = [f(p0) f(p1)];

iter = 0;
while 1
    iter = iter + 1;
    if iter>MaxIter
        break;
    end
    
    ptmp = p1;
    
    p1 = p1 - ((f(p1)*(p1-p0))/(f(p1)-f(p0)));
    
    P = [P p1];
    F = [F f(p1)];
    
    if abs(p1-ptmp)<tol
        break;
    end
    
    p0 = ptmp;
end
end