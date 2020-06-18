clear all
close all
format long

%Matrix from problem 5 Description
A = [4 -1 1; -1 3 -1; 1 -2 3]; 
m =3;

%if issymmetric(A) ~= 1
%    ['A is not symmteric']
%    return
%end

%"exact eigenvalue"
[QE Lam] = eig(A);   % "exact" e-value
Lam = sort(diag(Lam),'descend');
QE = QE(:,[m:-1:1]);
maxIter = 100;

%PURE QR
[lam1 Q1] = PureQR_Eig(A,maxIter);
%Shifted QR 
%[lam2 Q2] = ShiftedQR_Eig(A,maxIter);
%Shifted(Practical) QR
[lam3 Q3] = PracticalShiftedQR_Eig(A,maxIter);

[Lam lam1 lam3]
[sort(Lam) sort(lam1) sort(lam3)]
