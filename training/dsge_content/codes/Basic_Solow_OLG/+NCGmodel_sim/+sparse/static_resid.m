function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(11, 1);
end
[T_order, T] = NCGmodel_sim.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(4, 1);
    residual(1) = (T(5)) - (T(5)*params(1)*T(8));
    residual(2) = (y(1)) - (T(11));
    residual(3) = (y(2)) - (T(7)*exp(y(4))*T(9)-y(1)+y(2)*(1-params(3)));
    residual(4) = (y(4)) - (y(4)*params(6)+params(7)*x(1));
end
