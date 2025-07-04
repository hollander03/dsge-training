function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(1, 1);
end
[T_order, T] = basicNKMtidy.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(17, 1);
    residual(1) = (y(1)) - (y(2));
    residual(2) = (y(2)) - (y(2)-T(1)*y(4));
    residual(3) = (y(3)-y(12)) - (y(2)*params(3)/params(4)-y(5)*params(1)*1/params(4));
residual(4) = y(6);
    residual(5) = (y(5)) - (y(4)+y(6));
    residual(6) = (y(6)) - (y(10)+params(1)*y(6)+(1-params(6))*(1-params(6)*params(1))/params(6)*y(7));
    residual(7) = (y(7)) - (y(1)*(params(3)+params(5))-(1+params(5))*y(9));
    residual(8) = (y(8)) - ((-y(7)));
    residual(9) = (y(5)) - (y(5)*params(11)+(1-params(11))*(y(6)*params(7)+params(8)*y(16))+y(11));
    residual(10) = (y(9)) - (y(9)*params(9)+x(1));
    residual(11) = (y(10)) - (y(10)*params(10)+x(2));
    residual(12) = (y(11)) - (y(11)*params(12)+x(3));
    residual(13) = (y(13)) - (y(14));
    residual(14) = ((params(3)+params(5))*y(13)) - ((1+params(5))*y(9));
    residual(15) = (y(14)) - (y(14)-T(1)*y(15));
    residual(16) = (y(16)) - (y(1)-y(13));
    residual(17) = (y(17)) - (y(3)-y(12));
end
