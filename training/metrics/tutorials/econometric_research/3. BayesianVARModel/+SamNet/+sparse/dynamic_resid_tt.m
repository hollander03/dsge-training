function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 10
    T = [T; NaN(10 - size(T, 1), 1)];
end
T(1) = params(1)*(y(21)-params(39)*y(2))/(y(40)-y(21)*params(39));
T(2) = (y(30)-y(11))^2;
T(3) = y(6)^params(8);
T(4) = y(37)*T(3);
T(5) = y(26)^(1-params(8));
T(6) = params(2)*(y(22)-params(39)*y(3))/(y(41)-params(39)*y(22));
T(7) = params(8)*y(53)/y(25)+y(47)*(1-params(4));
T(8) = y(47)/y(51)*params(4)*params(37)/params(28);
T(9) = params(3)*(y(23)-params(39)*y(4))/(y(42)-params(39)*y(23));
T(10) = y(30)/y(34)/(params(28)/params(32));
end
