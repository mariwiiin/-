model laba_4_3
//x'' + g* x' + w^2* x = f(t)
parameter Real w = sqrt(7.5);
parameter Real g = 7.4; 
parameter Real x0 = 0.2;
parameter Real y0 = -0.2;
Real x(start=x0);
Real y(start=y0);
equation
der(x) = y; 
der(y) = -w*w*x - g*y + 2.2*cos(0.6*time);

end laba_4_3;
