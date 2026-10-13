function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = NCGmodel_sim.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 16
    T = [T; NaN(16 - size(T, 1), 1)];
end
T(12) = getPowerDeriv(T(3),1-params(5),1);
T(13) = (y(1)*T(2)*getPowerDeriv(y(1),params(2),1)*T(12)-T(4))/(y(1)*y(1));
T(14) = getPowerDeriv(y(2),params(4),1);
T(15) = T(12)*T(1)*(-(getPowerDeriv(1-y(3),1-params(2),1)))/y(1);
T(16) = getPowerDeriv(y(3),1-params(4),1);
end
