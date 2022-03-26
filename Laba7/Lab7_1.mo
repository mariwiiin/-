model Lab7_1
  // time [0:0.01:15]
  parameter Integer x0 = 12; // Начальное число знающих о товаре
  parameter Integer N = 1150; // максимальное число людей, которых может заинтересовать товар
  Real x(start=x0);
equation
  der(x) = (0.67 + 0.000067*x)*(N-x);

end Lab7_1;
