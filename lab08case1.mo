model lab08case1

constant Real p_cr = 35; //критическая стоимость продукта
constant Real N = 44; //число потребителей производимого продукта
constant Real q = 1; //максимальная потребность одного человека в продукте в единицу времени
constant Real tau_1 = 21; //длительность производственного цикла фирмы 1
constant Real tau_2 = 20; //длительность производственного цикла фирмы 2
constant Real p_1 = 13; //себестоимость продукта фирмы 1
constant Real p_2 = 10; //себестоимость продукта фирмы 2
constant Real a1 = p_cr/((tau_1^2)*(p_1^2)*N*q);
constant Real a2 = p_cr/((tau_2^2)*(p_2^2)*N*q);
constant Real b = p_cr/((tau_1^2)*(p_1^2)*(tau_2^2)*(p_2^2)*N*q);
constant Real c1 = (p_cr-p_1)/(tau_1*p_1);
constant Real c2 = (p_cr-p_2)/(tau_2*p_2);

Real M1; //оборотные средства предприятия 1
Real M2; //оборотные средства предприятия 2
Real teta; //безразмерное время
Real s_1; //стационарное состояние фирмы 1
Real s_2; //стационарное состояние фирмы 2

initial equation
M1 = 9.1;
M2 = 7.7;
teta = 0;

equation
s_1 = (c1*a2-b*c2)/(a1*a2-b*b);
s_2 = (a1*c2-b*c1)/(a1*a2-b*b);
teta = time/c1;
der(M1)/der(teta)=M1-(b/c1)*M1*M2-(a1/c1)*M1^2;
der(M2)/der(teta)=(c2/c1)*M2-(b/c1)*M1*M2-(a2/c1)*M2^2;

end lab08case1;
