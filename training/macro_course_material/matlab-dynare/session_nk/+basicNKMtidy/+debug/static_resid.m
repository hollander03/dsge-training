function [lhs, rhs] = static_resid(y, x, params)
T = NaN(1, 1);
lhs = NaN(17, 1);
rhs = NaN(17, 1);
T(1) = 1/params(3);
lhs(1) = y(1);
rhs(1) = y(2);
lhs(2) = y(2);
rhs(2) = y(2)-T(1)*y(4);
lhs(3) = y(3)-y(12);
rhs(3) = y(2)*params(3)/params(4)-y(5)*params(1)*1/params(4);
lhs(4) = y(6);
rhs(4) = 0;
lhs(5) = y(5);
rhs(5) = y(4)+y(6);
lhs(6) = y(6);
rhs(6) = y(10)+params(1)*y(6)+(1-params(6))*(1-params(6)*params(1))/params(6)*y(7);
lhs(7) = y(7);
rhs(7) = y(1)*(params(3)+params(5))-(1+params(5))*y(9);
lhs(8) = y(8);
rhs(8) = (-y(7));
lhs(9) = y(5);
rhs(9) = y(5)*params(11)+(1-params(11))*(y(6)*params(7)+params(8)*y(16))+y(11);
lhs(10) = y(9);
rhs(10) = y(9)*params(9)+x(1);
lhs(11) = y(10);
rhs(11) = y(10)*params(10)+x(2);
lhs(12) = y(11);
rhs(12) = y(11)*params(12)+x(3);
lhs(13) = y(13);
rhs(13) = y(14);
lhs(14) = (params(3)+params(5))*y(13);
rhs(14) = (1+params(5))*y(9);
lhs(15) = y(14);
rhs(15) = y(14)-T(1)*y(15);
lhs(16) = y(16);
rhs(16) = y(1)-y(13);
lhs(17) = y(17);
rhs(17) = y(3)-y(12);
end
