function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 11
    T = [T; NaN(11 - size(T, 1), 1)];
end
T(1) = y(1)^params(5);
T(2) = (1-y(3))^(1-params(5));
T(3) = T(1)*T(2);
T(4) = T(3)^(1-params(6));
T(5) = T(4)/y(1);
T(6) = params(3)*exp(y(4))*y(2)^(params(3)-1);
T(7) = y(3)^(1-params(3));
T(8) = 1+T(6)*T(7)-params(2);
T(9) = y(2)^params(3);
T(10) = y(3)^(-params(3));
T(11) = (1-y(3))*exp(y(4))*(1-params(3))*params(5)/(1-params(5))*T(9)*T(10);
end
