model laba_4_2
//x'' + g* x' + w^2* x = f(t)
parameter Real w = sqrt(4.3);
parameter Real g = 2; 
parameter Real x0 = 0.2;
parameter Real y0 = -0.2;
Real x(start=x0);
Real y(start=y0);
equation
der(x) = y; 
der(y) = -w*w*x - g*y;

end laba_4_2;
