model lab3_2
parameter Real a = 0.39;
parameter Real b = 0.84;
parameter Real c = 0.42;
parameter Real h = 0.49;
parameter Real x0 = 21050;
parameter Real y0 = 8900;
Real x(start=x0);
Real y(start=y0);
equation
der(x)=-a*x-b*y+abs(sin(2*time));
der(y)=-c*x*y-h*y+abs(cos(2*time));
end lab3_2;
