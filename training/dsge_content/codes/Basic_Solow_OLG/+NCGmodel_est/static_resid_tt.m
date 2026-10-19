function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
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

assert(length(T) >= 11);

T(1) = y(1)^params(5);
T(2) = (1-y(3))^(1-params(5));
T(3) = T(1)*T(2);
T(4) = T(3)^(1-params(6));
T(5) = T(4)/y(1);
T(6) = params(3)*exp(y(4))*y(2)^(params(3)-1);
T(7) = y(3)^(1-params(3));
T(8) = 1+T(6)*T(7)-params(2);
T(9) = y(2)^params(3);
T(10) = y(3)^(-params(3));
T(11) = (1-y(3))*exp(y(4))*(1-params(3))*params(5)/(1-params(5))*T(9)*T(10);

end
