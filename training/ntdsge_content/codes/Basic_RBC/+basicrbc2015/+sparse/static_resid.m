function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(2, 1);
end
[T_order, T] = basicrbc2015.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(7, 1);
    residual(1) = (y(1)) - ((1-T(2))*y(2)+T(2)*y(4));
residual(2) = 1/params(5)*y(6);
    residual(3) = (y(2)*params(5)) - (y(1)-y(3));
    residual(4) = (y(6)) - ((y(1)-y(5))*params(1)*1/T(1));
    residual(5) = (y(5)) - ((1-params(3))*y(5)+params(3)*y(4));
    residual(6) = (y(1)) - (y(7)+params(1)*y(5)+y(3)*(1-params(1)));
    residual(7) = (y(7)) - (y(7)*params(4)+x(1));
end
