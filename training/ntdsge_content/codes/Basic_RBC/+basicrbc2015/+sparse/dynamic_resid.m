function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(2, 1);
end
[T_order, T] = basicrbc2015.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(7, 1);
    residual(1) = (y(8)) - (y(9)*(1-T(2))+y(11)*T(2));
    residual(2) = (1/params(5)*y(20)) - (y(16)-y(9));
    residual(3) = (y(9)*params(5)) - (y(8)-y(10));
    residual(4) = (y(13)) - ((y(8)-y(5))*params(1)*1/T(1));
    residual(5) = (y(12)) - ((1-params(3))*y(5)+params(3)*y(11));
    residual(6) = (y(8)) - (y(14)+params(1)*y(5)+y(10)*(1-params(1)));
    residual(7) = (y(14)) - (params(4)*y(7)+x(1));
end
