function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 16
    T = [T; NaN(16 - size(T, 1), 1)];
end
T(1) = y(5)^params(2);
T(2) = (1-y(7))^(1-params(2));
T(3) = T(1)*T(2);
T(4) = T(3)^(1-params(5));
T(5) = y(9)^params(2);
T(6) = (1-y(11))^(1-params(2));
T(7) = T(5)*T(6);
T(8) = T(7)^(1-params(5));
T(9) = params(1)*T(8)/y(9);
T(10) = params(4)*exp(y(4))*y(2)^(params(4)-1);
T(11) = y(7)^(1-params(4));
T(12) = 1+T(10)*T(11)-params(3);
T(13) = exp(y(4))*(1-params(4))*params(2)/(1-params(2));
T(14) = y(2)^params(4);
T(15) = y(7)^(-params(4));
T(16) = (1-y(7))*T(13)*T(14)*T(15);
end
