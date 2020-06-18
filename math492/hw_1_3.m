%%%%%%%%% Euler Forward ODE solver
% y'=f(t,y)
% f(t,y) = -y +2e^(-t)cos(2t), exact solution y(t)=e^(-t)sin(2t)
% initial data y(t=0)=0
% Forward Euler: y{i+1}=y_i + h*f(t_i,y_i)
%%%%%%%%%%%%%%


N = [10, 20, 40, 80, 160]; %mesh 
T = 1.0; %final time 
%For each mesh size
for j=1:5
  %Let k be the time-step vatiable for mesh size N(j)
  k = T/N(j); 
 %Creating empty arrays
  t = zeros(N(j)+1); 
  y = zeros(N(j)+1); 
  Exact = zeros(N(j)+1);   
  error = zeros(N(j)+1);
  %Using IVP Data 
  y(1) = 0; 
  Exact(1) = 0;  
  %Constructing approximation
  for i=1:N(j)
     %set nodes t_i=0+i*dt, i=1,.N+1,
     t(i+1) = i*k; 
     %Calculate y(i+1) from Forward Euler
     y(i+1) = y(i)+k*(-1*y(i)+2*exp(-1*t(i))*cos(2*t(i)));  
     %Calculate exact solution for graphing
     Exact(i+1) = exp(-1*t(i+1))*sin(2*t(i+1));
     %Finally calculate the incremental error
     error(i+1)=abs(Exact(i+1)-y(i+1));
  end
 %Final error calculation for mesh size
 Error= abs( y(N(j)+1) - Exact(N(j)+1) );
 sprintf( 'N = %g: Error = %f', N(j), Error )
 %Plotting the exact & approximated solution
 if( j == 5 )
    plot( t, Exact ); 
    hold on;  
    plot( t, y, '*'); 
 end
end

