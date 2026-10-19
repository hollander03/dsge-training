function T = static_g1_tt(T, y, x, params)
% function T = static_g1_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 15);

T = NCGmodel_est.static_resid_tt(T, y, x, params);

T(12) = getPowerDeriv(T(3),1-params(6),1);
T(13) = (y(1)*T(2)*getPowerDeriv(y(1),params(5),1)*T(12)-T(4))/(y(1)*y(1));
T(14) = getPowerDeriv(y(2),params(3),1);
T(15) = T(12)*T(1)*(-(getPowerDeriv(1-y(3),1-params(5),1)))/y(1);

end
