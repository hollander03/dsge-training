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

assert(length(T) >= 10);

T(1) = params(1)*(y(13)-params(39)*y(1))/(y(31)-y(13)*params(39));
T(2) = (y(22)-y(7))^2;
T(3) = y(5)^params(8);
T(4) = y(29)*T(3);
T(5) = y(18)^(1-params(8));
T(6) = params(2)*(y(14)-params(39)*y(2))/(y(32)-params(39)*y(14));
T(7) = params(8)*y(36)/y(17)+y(34)*(1-params(4));
T(8) = y(34)/y(35)*params(4)*params(37)/params(28);
T(9) = params(3)*(y(15)-params(39)*y(3))/(y(33)-params(39)*y(15));
T(10) = y(22)/y(26)/(params(28)/params(32));

end
