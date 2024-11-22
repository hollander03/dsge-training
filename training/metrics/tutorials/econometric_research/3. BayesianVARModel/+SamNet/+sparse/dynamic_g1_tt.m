function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = SamNet.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 13
    T = [T; NaN(13 - size(T, 1), 1)];
end
T(11) = params(1)*(y(40)-y(21)*params(39)-(y(21)-params(39)*y(2))*(-params(39)))/((y(40)-y(21)*params(39))*(y(40)-y(21)*params(39)));
T(12) = params(2)*(y(41)-params(39)*y(22)-(y(22)-params(39)*y(3))*(-params(39)))/((y(41)-params(39)*y(22))*(y(41)-params(39)*y(22)));
T(13) = getPowerDeriv(T(10),params(12),1);
end
