function [lam Q] = PracticalShiftedQR_Eig(A,maxIter)

%%%%%%%%%%%%%%
%Practical QR
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

%Phase II:
U = eye(m);
%k = 0; 
for n = m:-1:2
    k = 0;
    while abs(A(n,n-1))>1e-30 & k<maxIter
        k=k+1;
        mu = A(n,n);
        [Q R] = qr(A-mu*eye(m));
        A = R*Q+mu*eye(m);
        U = U*Q;
    end
    %A
    %pause
    A(n,n-1) = 0; A(n-1,n) = 0;
end
 
lam = diag(A);

