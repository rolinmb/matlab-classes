function [P F A B] = bisection(f, a, b, tol, MaxIter)
% A[i] & B[i] represent the endpoints of 
% the interval in question
A = [];
B = [];
% P[i]=(A[i-1]+B[i-1])/2
P = [];
% F[i] is the function f evaluated at P[i] or f(P[i])
F = [];

iter = 0;
while 1
   iter = iter + 1;
   % Termination Criteria 1
   if iter > MaxIter
       break;
   end
   
   % Define value of P for iteration
   p = (a+b)/2;
   % Update/Store data in arrays
   A = [A a];
   B = [B b];
   P = [P p];
   F = [F f(p)];
   
   % Termination Criteria 2
   if p-a < tol
       break;
   end
   
   % Find new interval endpoints a,b for next iteration
   if f(a)*f(p) > 0
       a = p; % p is left endpoint
   else
       b = p; % p is right endpoint
   end 
end