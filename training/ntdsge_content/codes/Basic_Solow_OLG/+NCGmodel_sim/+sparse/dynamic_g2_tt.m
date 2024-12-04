function [T_order, T] = dynamic_g2_tt(y, x, params, steady_state, T_order, T)
if T_order >= 2
    return
end
[T_order, T] = NCGmodel_sim.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
T_order = 2;
if size(T, 1) < 35
    T = [T; NaN(35 - size(T, 1), 1)];
end
T(32) = getPowerDeriv(T(3),1-params(5),2);
T(33) = getPowerDeriv(T(7),1-params(5),2);
T(34) = getPowerDeriv(y(7),1-params(4),2);
T(35) = getPowerDeriv(y(2),params(4),2);
end
