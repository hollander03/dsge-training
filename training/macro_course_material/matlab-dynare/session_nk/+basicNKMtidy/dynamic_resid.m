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
    T = basicNKMtidy.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(17, 1);
    residual(1) = (y(6)) - (y(7));
    residual(2) = (y(7)) - (y(23)-T(1)*y(9));
    residual(3) = (y(8)-y(17)) - (y(7)*params(3)/params(4)-y(10)*params(1)*1/params(4));
    residual(4) = (y(11)) - (y(17)-y(5));
    residual(5) = (y(10)) - (y(9)+y(24));
    residual(6) = (y(11)) - (y(15)+params(1)*y(24)+(1-params(6))*(1-params(6)*params(1))/params(6)*y(12));
    residual(7) = (y(12)) - (y(6)*(params(3)+params(5))-(1+params(5))*y(14));
    residual(8) = (y(13)) - ((-y(12)));
    residual(9) = (y(10)) - (params(11)*y(1)+(1-params(11))*(y(11)*params(7)+params(8)*y(21))+y(16));
    residual(10) = (y(14)) - (params(9)*y(2)+x(it_, 1));
    residual(11) = (y(15)) - (params(10)*y(3)+x(it_, 2));
    residual(12) = (y(16)) - (params(12)*y(4)+x(it_, 3));
    residual(13) = (y(18)) - (y(19));
    residual(14) = ((params(3)+params(5))*y(18)) - ((1+params(5))*y(14));
    residual(15) = (y(19)) - (y(25)-T(1)*y(20));
    residual(16) = (y(21)) - (y(6)-y(18));
    residual(17) = (y(22)) - (y(8)-y(17));

end
