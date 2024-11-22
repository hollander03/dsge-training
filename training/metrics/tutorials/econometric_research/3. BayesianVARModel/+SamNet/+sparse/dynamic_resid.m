function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(10, 1);
end
[T_order, T] = SamNet.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(19, 1);
    residual(1) = (y(21)+y(29)+y(28)*(y(24)-y(5))) - (y(27)*y(26)+y(12)*y(10));
    residual(2) = (1) - (T(1)*y(31));
    residual(3) = (y(28)) - (params(6)*y(36)*(y(21)-params(39)*y(2))/(y(24)*(1-params(39)))+T(1)*y(47));
    residual(4) = (y(27)) - (params(7)/(1-y(26))*(y(21)-params(39)*y(2))/(1-params(39)));
    residual(5) = (y(27)*y(26)+y(22)+y(28)*(y(25)-y(6))+y(32)*y(11)+params(37)/(2*params(28))*T(2)) - (y(30)+y(34));
    residual(6) = (y(34)) - (T(4)*T(5));
    residual(7) = (y(30)) - (y(25)*params(4)*y(47)/y(51)-y(26)*y(27)*params(5));
    residual(8) = (y(28)) - (params(4)*y(47)/y(51)+T(6)*T(7)-(y(30)-y(11))*T(8));
    residual(9) = (y(34)*(1-params(8))) - (y(27)*y(26)*(1+params(5)*(1-y(51)*T(6))));
    residual(10) = (y(30)+y(12)*y(10)+y(23)+T(2)*params(38)/(2*params(28))) - (y(29)+y(32)*y(11));
    residual(11) = (y(29)) - (y(30)*(1-y(35))-y(38));
    residual(12) = (1-(1-y(35))+(y(30)-y(11))*params(38)/params(28)) - (T(9)*(y(51)-y(31)*(1-y(35))));
    residual(13) = (y(24)+y(25)) - (1);
    residual(14) = (y(35)) - (params(33)*T(10)^params(12));
    residual(15) = (y(33)) - (y(32)-y(31));
    residual(16) = (y(20)) - (y(23)+y(21)+y(22));
    residual(17) = (log(y(36))) - (params(9)*log(y(17))+x(1));
    residual(18) = (y(38)) - (params(11)*y(19)+x(3));
    residual(19) = (log(y(37))) - (params(10)*log(y(18))+x(2));
end
