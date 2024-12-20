function [lhs, rhs] = static_resid(y, x, params)
T = NaN(2, 1);
lhs = NaN(10, 1);
rhs = NaN(10, 1);
T(1) = params(1)/(1/params(2)-(1-params(3)));
T(2) = params(3)*T(1);
lhs(1) = y(1);
rhs(1) = (1-T(2))*y(2)+T(2)*y(4);
lhs(2) = 1/params(5)*y(6);
rhs(2) = 0;
lhs(3) = y(2)*params(5);
rhs(3) = y(1)-y(3);
lhs(4) = y(6);
rhs(4) = (y(1)-y(5))*params(1)*1/T(1);
lhs(5) = y(5);
rhs(5) = (1-params(3))*y(5)+params(3)*y(4);
lhs(6) = y(1);
rhs(6) = y(7)+params(1)*y(5)+y(3)*(1-params(1));
lhs(7) = y(7);
rhs(7) = y(7)*params(4)+x(1);
lhs(8) = y(8);
rhs(8) = params(7);
lhs(9) = y(9);
rhs(9) = 0;
lhs(10) = y(10);
rhs(10) = 0;
end
