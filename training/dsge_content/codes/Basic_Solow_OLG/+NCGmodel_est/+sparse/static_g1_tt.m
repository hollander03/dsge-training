function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = NCGmodel_est.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 15
    T = [T; NaN(15 - size(T, 1), 1)];
end
T(12) = getPowerDeriv(T(3),1-params(6),1);
T(13) = (y(1)*T(2)*getPowerDeriv(y(1),params(5),1)*T(12)-T(4))/(y(1)*y(1));
T(14) = getPowerDeriv(y(2),params(3),1);
T(15) = T(12)*T(1)*(-(getPowerDeriv(1-y(3),1-params(5),1)))/y(1);
end
