function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = NCGmodel_est.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 32
    T = [T; NaN(32 - size(T, 1), 1)];
end
T(17) = getPowerDeriv(y(5),params(5),1);
T(18) = T(2)*T(17);
T(19) = getPowerDeriv(T(3),1-params(6),1);
T(20) = getPowerDeriv(y(9),params(5),1);
T(21) = T(6)*T(20);
T(22) = getPowerDeriv(T(7),1-params(6),1);
T(23) = params(1)*(y(9)*T(21)*T(22)-T(8))/(y(9)*y(9));
T(24) = params(3)*exp(y(4))*getPowerDeriv(y(2),params(3)-1,1);
T(25) = T(11)*T(24);
T(26) = getPowerDeriv(y(2),params(3),1);
T(27) = (-(getPowerDeriv(1-y(7),1-params(5),1)));
T(28) = getPowerDeriv(y(7),1-params(3),1);
T(29) = T(10)*T(28);
T(30) = getPowerDeriv(y(7),(-params(3)),1);
T(31) = (-(getPowerDeriv(1-y(11),1-params(5),1)));
T(32) = params(1)*T(22)*T(5)*T(31)/y(9);
end
