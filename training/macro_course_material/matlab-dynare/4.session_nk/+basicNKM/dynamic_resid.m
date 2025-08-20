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
    T = basicNKM.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(14, 1);
    residual(1) = (y(4)) - (y(5));
    residual(2) = (y(5)) - (y(18)-T(1)*y(7));
    residual(3) = (y(6)) - (y(5)*params(3)/params(4)-y(8)*params(1)*1/params(4));
    residual(4) = (y(8)) - (y(7)+y(19));
    residual(5) = (y(9)) - (y(13)+params(1)*y(19)+(1-params(6))*(1-params(6)*params(1))/params(6)*y(10));
    residual(6) = (y(10)) - (y(4)*(params(3)+params(5))-(1+params(5))*y(12));
    residual(7) = (y(11)) - ((-y(10)));
    residual(8) = (y(8)) - (params(11)*y(1)+(1-params(11))*(y(9)*params(7)+params(8)*y(17))+x(it_, 3));
    residual(9) = (y(12)) - (params(9)*y(2)+x(it_, 1));
    residual(10) = (y(13)) - (params(10)*y(3)+x(it_, 2));
    residual(11) = (y(14)) - (y(15));
    residual(12) = ((params(3)+params(5))*y(14)) - ((1+params(5))*y(12));
    residual(13) = (y(15)) - (y(20)-T(1)*y(16));
    residual(14) = (y(17)) - (y(4)-y(14));

end
