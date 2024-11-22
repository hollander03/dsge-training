function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = SamNet.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(19, 1);
    residual(1) = (y(13)+y(21)+y(20)*(y(16)-y(4))) - (y(19)*y(18)+y(8)*y(6));
    residual(2) = (1) - (T(1)*y(23));
    residual(3) = (y(20)) - (params(6)*y(28)*(y(13)-params(39)*y(1))/(y(16)*(1-params(39)))+T(1)*y(34));
    residual(4) = (y(19)) - (params(7)/(1-y(18))*(y(13)-params(39)*y(1))/(1-params(39)));
    residual(5) = (y(19)*y(18)+y(14)+y(20)*(y(17)-y(5))+y(24)*y(7)+params(37)/(2*params(28))*T(2)) - (y(22)+y(26));
    residual(6) = (y(26)) - (T(4)*T(5));
    residual(7) = (y(22)) - (y(17)*params(4)*y(34)/y(35)-y(18)*y(19)*params(5));
    residual(8) = (y(20)) - (params(4)*y(34)/y(35)+T(6)*T(7)-(y(22)-y(7))*T(8));
    residual(9) = (y(26)*(1-params(8))) - (y(19)*y(18)*(1+params(5)*(1-y(35)*T(6))));
    residual(10) = (y(22)+y(8)*y(6)+y(15)+T(2)*params(38)/(2*params(28))) - (y(21)+y(24)*y(7));
    residual(11) = (y(21)) - (y(22)*(1-y(27))-y(30));
    residual(12) = (1-(1-y(27))+(y(22)-y(7))*params(38)/params(28)) - (T(9)*(y(35)-y(23)*(1-y(27))));
    residual(13) = (y(16)+y(17)) - (1);
    residual(14) = (y(27)) - (params(33)*T(10)^params(12));
    residual(15) = (y(25)) - (y(24)-y(23));
    residual(16) = (y(12)) - (y(15)+y(13)+y(14));
    residual(17) = (log(y(28))) - (params(9)*log(y(9))+x(it_, 1));
    residual(18) = (y(30)) - (params(11)*y(11)+x(it_, 3));
    residual(19) = (log(y(29))) - (params(10)*log(y(10))+x(it_, 2));

end
