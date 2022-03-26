model Lab7_3
  // time [0:0.001:0.04]
  parameter Integer x0 = 12; // Начальное число знающих о товаре
  parameter Integer N = 1150; // максимальное число людей, которых может заинтересовать товар
  Real x(start=x0);
equation
  der(x) = (0.76*sin(time) + 0.67*cos(time)*x)*(N-x);

end Lab7_3;
