function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 4
    T = [T; NaN(4 - size(T, 1), 1)];
end
T(1) = y(6)^params(8);
T(2) = y(18)*T(1);
T(3) = y(7)^(1-params(8));
T(4) = y(11)/y(15)/(params(28)/params(32));
end
