function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 16);

T(1) = y(3)^params(2);
T(2) = (1-y(5))^(1-params(2));
T(3) = T(1)*T(2);
T(4) = T(3)^(1-params(5));
T(5) = y(7)^params(2);
T(6) = (1-y(8))^(1-params(2));
T(7) = T(5)*T(6);
T(8) = T(7)^(1-params(5));
T(9) = params(1)*T(8)/y(7);
T(10) = params(4)*exp(y(2))*y(1)^(params(4)-1);
T(11) = y(5)^(1-params(4));
T(12) = 1+T(10)*T(11)-params(3);
T(13) = exp(y(2))*(1-params(4))*params(2)/(1-params(2));
T(14) = y(1)^params(4);
T(15) = y(5)^(-params(4));
T(16) = (1-y(5))*T(13)*T(14)*T(15);

end
