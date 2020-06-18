% Solve over time interval [0,100] with initial conditions [-8,8,27]
% dx/dt = 10(x-y)
% dy/dt = -xz + 28x-y
% dz/dt = xy-(3/8)z
% Use initial point (-8,8,27)

%Time interval h and final time T
h = 0.01;
T = 100;
N = 10000;
%Constants for the Lorenz System (Sigma,Rho&Beta)
s = 10;
p = 28;
b = 8/3;
%Initialize data arrays to be zeroes with size N(j)+1 for initial data
t = zeros(N+1);
x = zeros(N+1);
y = zeros(N+1);
z = zeros(N+1);
%Use initial position data
x(1) = -8;
y(1) = 8;
z(1) = 27;
t(1) = 0.0;
%Loop to generate solution in data arrays t,x,y,z
for i=1:N
   k1 = s*(y(i)-x(i));
   g1 = (p*x(i))-y(i)-(x(i)*z(i));
   w1 = (x(i)*y(i))-(b*z(i));
   
   k2 = s*((y(i)+h*g1)-(x(i)+h*k1));
   g2 = 28*(x(i)+h*w1)-(y(i)+h*g1)-((x(i)+h*k1)*(y(i)+h*g1));
   w2 = ((x(i)+h*k1)*(y(i)+h*g1))-(b*(z(i)+h*w1));
   
   x(i+1) = x(i)+((h/2)*(k1+k2));
   y(i+1) = y(i)+((h/2)*(g1+g2));
   z(i+1) = z(i)+((h/2)*(w1+w2));
   t(i+1) = t(i)+h;
end
plot3(x,y,z)
title("Lorenz Attractor"); xlabel("x"); ylabel("y"); zlabel("z");
