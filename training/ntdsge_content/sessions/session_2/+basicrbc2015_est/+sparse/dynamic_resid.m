function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(2, 1);
end
[T_order, T] = basicrbc2015_est.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(8, 1);
    residual(1) = (y(9)) - (y(10)*(1-T(2))+y(12)*T(2));
    residual(2) = (1/params(5)*y(22)) - (y(18)-y(10));
    residual(3) = (y(10)*params(5)) - (y(9)-y(11));
    residual(4) = (y(14)) - ((y(9)-y(5))*params(1)*1/T(1));
    residual(5) = (y(13)) - ((1-params(3))*y(5)+params(3)*y(12));
    residual(6) = (y(9)) - (y(15)+params(1)*y(5)+y(11)*(1-params(1)));
    residual(7) = (y(15)) - (params(4)*y(7)+x(1));
    residual(8) = (y(16)) - (y(9)-y(1)+params(7));
end
