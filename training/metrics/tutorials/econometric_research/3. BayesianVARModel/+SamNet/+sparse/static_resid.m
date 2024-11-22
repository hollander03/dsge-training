function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(4, 1);
end
[T_order, T] = SamNet.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(19, 1);
    residual(1) = (y(2)+y(10)) - (y(8)*y(7)+y(10)*y(12));
    residual(2) = (1) - (y(12)*params(1));
    residual(3) = (y(9)) - (params(6)*y(17)*(y(2)-y(2)*params(39))/(y(5)*(1-params(39)))+y(9)*params(1));
    residual(4) = (y(8)) - (params(7)/(1-y(7))*(y(2)-y(2)*params(39))/(1-params(39)));
    residual(5) = (y(8)*y(7)+y(3)+y(13)*y(11)) - (y(11)+y(15));
    residual(6) = (y(15)) - (T(2)*T(3));
    residual(7) = (y(11)) - (y(6)*params(4)*y(9)/y(13)-y(7)*y(8)*params(5));
    residual(8) = (y(9)) - (params(4)*y(9)/y(13)+params(2)*(y(15)*params(8)/y(6)+y(9)*(1-params(4))));
    residual(9) = (y(15)*(1-params(8))) - (y(8)*y(7)*(1+params(5)*(1-y(13)*params(2))));
    residual(10) = (y(11)+y(10)*y(12)+y(4)) - (y(10)+y(13)*y(11));
    residual(11) = (y(10)) - (y(11)*(1-y(16))-y(19));
    residual(12) = (1-(1-y(16))) - (params(3)*(y(13)-y(12)*(1-y(16))));
    residual(13) = (y(5)+y(6)) - (1);
    residual(14) = (y(16)) - (params(33)*T(4)^params(12));
    residual(15) = (y(14)) - (y(13)-y(12));
    residual(16) = (y(1)) - (y(4)+y(2)+y(3));
    residual(17) = (log(y(17))) - (log(y(17))*params(9)+x(1));
    residual(18) = (y(19)) - (y(19)*params(11)+x(3));
    residual(19) = (log(y(18))) - (log(y(18))*params(10)+x(2));
end
