% To solve the Lorenz equations. It uses the file lorenz.m
clear all % Clear all variables
t=[0 100]; % Time window
xinit=[-8;8;27]; % Initial condition
[t,x]=ode45(@lorenz,t,xinit); % Integrate in time
plot3(x(:,1),x(:,2),x(:,3)) % Plot solution
title("Lorenz Attractor 1"); xlabel("x"); ylabel("y"); zlabel("z");