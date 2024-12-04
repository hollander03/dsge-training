function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(2, 1);
end
[T_order, T] = basicrbc2015_est.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(10, 1);
    residual(1) = (y(11)) - (y(12)*(1-T(2))+y(14)*T(2));
    residual(2) = (1/params(5)*y(26)) - (y(22)-y(12));
    residual(3) = (y(12)*params(5)) - (y(11)-y(13));
    residual(4) = (y(16)) - ((y(11)-y(5))*params(1)*1/T(1));
    residual(5) = (y(15)) - ((1-params(3))*y(5)+params(3)*y(14));
    residual(6) = (y(11)) - (y(17)+params(1)*y(5)+y(13)*(1-params(1)));
    residual(7) = (y(17)) - (params(4)*y(7)+x(1));
    residual(8) = (y(18)) - (y(11)-y(1)+params(7));
    residual(9) = (y(19)) - (y(12)-y(2));
    residual(10) = (y(20)) - (y(14)-y(4));
end
