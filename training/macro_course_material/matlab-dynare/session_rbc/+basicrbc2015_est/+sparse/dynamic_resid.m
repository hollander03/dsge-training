function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(2, 1);
end
[T_order, T] = basicrbc2015_est.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(12, 1);
    residual(1) = (y(13)) - (y(23)+y(14)*(1-T(2))+y(16)*T(2));
    residual(2) = (1/params(7)*y(30)) - (y(26)-y(14)+y(24));
    residual(3) = (y(14)*params(7)) - (y(13)-y(15));
    residual(4) = (y(18)) - ((y(13)-y(5))*params(1)*1/T(1));
    residual(5) = (y(17)) - ((1-params(3))*y(5)+params(3)*y(16));
    residual(6) = (y(13)) - (y(19)+params(1)*y(5)+y(15)*(1-params(1)));
    residual(7) = (y(19)) - (params(4)*y(7)+x(1));
    residual(8) = (y(23)) - (params(5)*y(11)+x(2));
    residual(9) = (y(24)) - (params(6)*y(12)+x(3));
    residual(10) = (y(20)) - (y(13));
    residual(11) = (y(21)) - (y(14)-y(2)+params(10));
    residual(12) = (y(22)) - (y(16)-y(4)+params(11));
end
