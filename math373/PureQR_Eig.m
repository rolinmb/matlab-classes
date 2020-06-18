function [lam Q] = PureQR_Eig(A,maxIter)

%%%%%%%%%
%PURE QR
%%%%%%%%%

[m m2] = size(A);

if m~=m2 
    [' A is not square ']
    return
end

%phase I: householder to Hessenberg
A = hess(A);

%phase II: "Pure" QR
for k=1:maxIter
    [Q R] = qr(A);
    A = R*Q;
end

lam = diag(A);