model lab3_1
parameter Real a = 0.32;
parameter Real b = 0.74;
parameter Real c = 0.44;
parameter Real h = 0.52;
parameter Real x0 = 21050;
parameter Real y0 = 8900;
Real x(start=x0);
Real y(start=y0);
equation
der(x)=-a*x-b*y+2*abs(sin(time));
der(y)=-c*x-h*y+2*abs(cos(time));
end lab3_1;
