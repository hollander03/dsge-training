function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = NCGmodel_sim.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 31
    T = [T; NaN(31 - size(T, 1), 1)];
end
T(17) = getPowerDeriv(y(5),params(2),1);
T(18) = T(2)*T(17);
T(19) = getPowerDeriv(T(3),1-params(5),1);
T(20) = getPowerDeriv(y(9),params(2),1);
T(21) = T(6)*T(20);
T(22) = getPowerDeriv(T(7),1-params(5),1);
T(23) = params(1)*(y(9)*T(21)*T(22)-T(8))/(y(9)*y(9));
T(24) = params(4)*exp(y(4))*getPowerDeriv(y(2),params(4)-1,1);
T(25) = T(11)*T(24);
T(26) = getPowerDeriv(y(2),params(4),1);
T(27) = (-(getPowerDeriv(1-y(7),1-params(2),1)));
T(28) = getPowerDeriv(y(7),1-params(4),1);
T(29) = getPowerDeriv(y(7),(-params(4)),1);
T(30) = (-(getPowerDeriv(1-y(11),1-params(2),1)));
T(31) = params(1)*T(22)*T(5)*T(30)/y(9);
end
