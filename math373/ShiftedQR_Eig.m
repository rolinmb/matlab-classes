function [lam Q] = ShiftedQR_Eig(A,maxIter)

%%%%%%%%%%%%%%
%QR
%with shifts
%Rayleigh quotient shift
%%%%%%%%%%%%%%

[m m2] = size(A);

if m~=m2 
    [' A is not square ']
    return
end

%Phase I:
A = hess(A);

%Phase II
for k=1:maxIter
    mu = A(m,m);
    [Q R] = qr(A-mu*eye(m));
    A = R*Q+mu*eye(m);  
end

lam = diag(A);