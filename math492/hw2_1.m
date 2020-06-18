%%%%%%%%% Euler Forward ODE solver
% y'=f(t,y)
% f(t,y) = -y +2e^(-t)cos(2t), exact solution y(t)=e^(-t)sin(2t)
% initial data y(t=0)=0
% Forward Euler: y{i+1}=y_i + h*f(t_i,y_i)
% Modified Euler: y{i+1}=y_i + h/2*{f(t_i,y_i)+ f(t_i+h,y_i+h*f(t_i,y_i))}
%%%%%%%%%%%%%%


N = [10, 20, 40, 80, 160]; %mesh size
T = 1.0; %final time 
for j=1:5
  %Calculate the timestep for meshsize N(j)
  h = T/N(j); 
  %Initialize storage arrays
  t = zeros(N(j)+1); 
  y = zeros(N(j)+1); 
  Exact = zeros(N(j)+1);   
  error = zeros(N(j)+1);
  %Use the given initial data
  y(1) = 0; 
  Exact(1) = 0;  

     for i=1:N(j)
     %set nodes t_i=0+i*dt, i=1,.N+1,
     t(i+1) = i*h; 
     %k1 = f(t_i,y_i); k2 = f(t_i + h, y_i + h*f(t_i,y_i))
     k1 = -1*y(i) + (2*exp(-1*t(i))*cos(2*t(i)));
     k2 = -(1*y(i)+(h*k1))+(2*exp(-1*(t(i)+h))*cos(2*(t(i)+h)));
     %y(i+1)=y(i)+ k/2 * [ f(t(i),y(i)) + f(t(i)+h,y(i)+ h*f{t(i),y(i)}) ]
     %This is the given y'(t)
     y(i+1) = y(i)+((h/2)*(k1+k2));   
     %Calculate exact solution and error
     Exact(i+1) = exp(-1*t(i+1))*sin(2*t(i+1)); 
     error(i+1)=abs(Exact(i+1)-y(i+1));
     end

Error= abs( y(N(j)+1) - Exact(N(j)+1) );
sprintf( 'N = %g: Error = %f', N(j), Error )
if( j == 5 )
    plot( t, Exact ); 
    hold on;  
    plot( t, y, '*'); 
end
end
