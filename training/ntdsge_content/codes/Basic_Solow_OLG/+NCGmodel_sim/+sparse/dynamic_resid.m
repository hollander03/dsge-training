function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(16, 1);
end
[T_order, T] = NCGmodel_sim.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(4, 1);
    residual(1) = (T(4)/y(5)) - (T(9)*T(12));
    residual(2) = (y(5)) - (T(16));
    residual(3) = (y(6)) - (T(11)*exp(y(4))*T(14)-y(5)+y(2)*(1-params(3)));
    residual(4) = (y(8)) - (y(4)*params(6)+params(7)*x(1));
end
