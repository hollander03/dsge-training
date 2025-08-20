function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(1, 1);
end
[T_order, T] = basicNKM.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(14, 1);
    residual(1) = (y(15)) - (y(16));
    residual(2) = (y(16)) - (y(30)-T(1)*y(18));
    residual(3) = (y(17)) - (y(16)*params(3)/params(4)-y(19)*params(1)*1/params(4));
    residual(4) = (y(19)) - (y(18)+y(34));
    residual(5) = (y(20)) - (y(24)+params(1)*y(34)+(1-params(6))*(1-params(6)*params(1))/params(6)*y(21));
    residual(6) = (y(21)) - (y(15)*(params(3)+params(5))-(1+params(5))*y(23));
    residual(7) = (y(22)) - ((-y(21)));
    residual(8) = (y(19)) - (params(11)*y(5)+(1-params(11))*(y(20)*params(7)+params(8)*y(28))+x(3));
    residual(9) = (y(23)) - (params(9)*y(9)+x(1));
    residual(10) = (y(24)) - (params(10)*y(10)+x(2));
    residual(11) = (y(25)) - (y(26));
    residual(12) = ((params(3)+params(5))*y(25)) - ((1+params(5))*y(23));
    residual(13) = (y(26)) - (y(40)-T(1)*y(27));
    residual(14) = (y(28)) - (y(15)-y(25));
end
