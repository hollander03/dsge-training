function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(1, 1);
end
[T_order, T] = basicNKMtidy.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(17, 1);
    residual(1) = (y(18)) - (y(19));
    residual(2) = (y(19)) - (y(36)-T(1)*y(21));
    residual(3) = (y(20)-y(29)) - (y(19)*params(3)/params(4)-y(22)*params(1)*1/params(4));
    residual(4) = (y(23)) - (y(29)-y(12));
    residual(5) = (y(22)) - (y(21)+y(40));
    residual(6) = (y(23)) - (y(27)+params(1)*y(40)+(1-params(6))*(1-params(6)*params(1))/params(6)*y(24));
    residual(7) = (y(24)) - (y(18)*(params(3)+params(5))-(1+params(5))*y(26));
    residual(8) = (y(25)) - ((-y(24)));
    residual(9) = (y(22)) - (params(11)*y(5)+(1-params(11))*(y(23)*params(7)+params(8)*y(33))+y(28));
    residual(10) = (y(26)) - (params(9)*y(9)+x(1));
    residual(11) = (y(27)) - (params(10)*y(10)+x(2));
    residual(12) = (y(28)) - (params(12)*y(11)+x(3));
    residual(13) = (y(30)) - (y(31));
    residual(14) = ((params(3)+params(5))*y(30)) - ((1+params(5))*y(26));
    residual(15) = (y(31)) - (y(48)-T(1)*y(32));
    residual(16) = (y(33)) - (y(18)-y(30));
    residual(17) = (y(34)) - (y(20)-y(29));
end
