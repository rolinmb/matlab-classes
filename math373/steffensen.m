function [P G] = steffensen(g, p0, tol, MaxIter)

P = [p0];
G = [g(p0)];

iter = 0;
while 1
    iter = iter + 1;
    if iter>MaxIter
        break;
    end
    
    p1 = g(p0);
    p2 = g(p1);
    
    p = p0 - ((p1-p0)^2)/(p2 - 2*p1 + p0);
    
    P = [P p];
    G = [G g(p)];
    
    if abs(p-p0)<tol
        break;
    end
    
    p0 = p;
    
end

end