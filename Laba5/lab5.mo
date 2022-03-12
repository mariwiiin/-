model lab5
  parameter Real a = 0.67;
  parameter Real b = 0.067;
  parameter Real c = 0.66;
  parameter Real d = 0.065;
  parameter Real x0 = 9;
  parameter Real y0 = 19;
  Real x(start = x0);
  Real y(start = y0);
  parameter Real stat_x = c/d;
  parameter Real stat_y= a/b;
equation
  der(x) = -a*x + b*x*y;
  der(y) = c*y - d*x*y;
end lab5;
