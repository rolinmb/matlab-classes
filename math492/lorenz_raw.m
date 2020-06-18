clear all
% dx/dt=sig*(y-x); dy/dt=-x*z+r*x-y; dz/dt=x*y-b*z
sig=10; b=8/3; r=20; % Parameters
t(1)=0.0; % Initial t
x(1)=-8; y(1)=8; z(1)=27; % Initial x,y,z

%Iterative solution conditions
h=0.01; % Time step
nn=10000; % Number of time steps

for i=1:nn             % Time loop
x1=sig*(y(i)-x(i));         % Change of x-location
y1=-x(i)*z(i)+r*x(i)-y(i);  % Change of y-location
z1=x(i)*y(i)-b*z(i);        % Change of z-location

x(i+1)=x(i)+h*x1;    % Find new x
y(i+1)=y(i)+h*y1;    % Find new y
z(i+1)=z(i)+h*z1;    % Find new z
t(i+1)=t(i)+h;                % Find new t
end                    % Close time loop
%Design plot of result
plot3(x,y,z) 
title("Lorenz Attractor Explicit"); xlabel("x"); ylabel("y"); zlabel("z");