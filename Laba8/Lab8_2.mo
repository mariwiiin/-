model Lab8_2
  parameter Real M0_1 = 3.3; // Начальное x1
  parameter Real M0_2 = 2.3; // Начальное x2
  parameter Real p_cr = 22; // Критическая стоимость продукта
  parameter Real tau1 = 22; // Длительность производственного цикла 1 фирмы
  parameter Real tau2 = 11; // Длительность производственного цикла 2 фирмы
  parameter Real p1= 6.6; // Себестоимость продукта фирмы 1
  parameter Real p2 = 11.1; // Себестоимость продукта фирмы 2
  parameter Real N = 33; // Число потребителей производимого продукта
  parameter Real q = 1; // максимальная потребность одного человека в продукте в единицу времени
  Real x1(start = M0_1); 
  Real x2(start = M0_2);
  
  parameter Real a1 = p_cr / (tau1 * tau1 * p1 * p1 * N * q);
  parameter Real a2 = p_cr / (tau2 * tau2 * p2 * p2 * N * q);
  parameter Real b = p_cr / (tau1 * tau1 * tau2 * tau2 * p2 * p2 * N * q);
  parameter Real c1 = (p_cr - p1) / (tau1 * p1);
  parameter Real c2 = (p_cr - p2) / (tau1 * p2);
  
equation
  der(x1) = (c1/c1) * x1 - (b/c1 + 0.0093) * x1 * x2 - (a1/c1) * x1 * x1;
  der(x2) = (c2/c1) * x2 - (b/c1) * x1 * x2 - (a2/c1) * x2 * x2;

end Lab8_2;
