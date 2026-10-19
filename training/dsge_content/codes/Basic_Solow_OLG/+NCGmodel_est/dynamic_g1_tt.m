function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 32);

T = NCGmodel_est.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(17) = getPowerDeriv(y(3),params(5),1);
T(18) = T(2)*T(17);
T(19) = getPowerDeriv(T(3),1-params(6),1);
T(20) = getPowerDeriv(y(7),params(5),1);
T(21) = T(6)*T(20);
T(22) = getPowerDeriv(T(7),1-params(6),1);
T(23) = params(1)*(y(7)*T(21)*T(22)-T(8))/(y(7)*y(7));
T(24) = params(3)*exp(y(2))*getPowerDeriv(y(1),params(3)-1,1);
T(25) = T(11)*T(24);
T(26) = getPowerDeriv(y(1),params(3),1);
T(27) = (-(getPowerDeriv(1-y(5),1-params(5),1)));
T(28) = getPowerDeriv(y(5),1-params(3),1);
T(29) = T(10)*T(28);
T(30) = getPowerDeriv(y(5),(-params(3)),1);
T(31) = (-(getPowerDeriv(1-y(8),1-params(5),1)));
T(32) = params(1)*T(22)*T(5)*T(31)/y(7);

end
