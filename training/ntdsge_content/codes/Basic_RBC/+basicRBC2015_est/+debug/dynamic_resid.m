function [lhs, rhs] = dynamic_resid(y, x, params, steady_state)
T = NaN(2, 1);
lhs = NaN(8, 1);
rhs = NaN(8, 1);
T(1) = params(1)/(1/params(2)-(1-params(3)));
T(2) = params(3)*T(1);
lhs(1) = y(9);
rhs(1) = y(10)*(1-T(2))+y(12)*T(2);
lhs(2) = 1/params(5)*y(22);
rhs(2) = y(18)-y(10);
lhs(3) = y(10)*params(5);
rhs(3) = y(9)-y(11);
lhs(4) = y(14);
rhs(4) = (y(9)-y(5))*params(1)*1/T(1);
lhs(5) = y(13);
rhs(5) = (1-params(3))*y(5)+params(3)*y(12);
lhs(6) = y(9);
rhs(6) = y(15)+params(1)*y(5)+y(11)*(1-params(1));
lhs(7) = y(15);
rhs(7) = params(4)*y(7)+x(1);
lhs(8) = y(16);
rhs(8) = y(9)-y(1)+params(7);
end
