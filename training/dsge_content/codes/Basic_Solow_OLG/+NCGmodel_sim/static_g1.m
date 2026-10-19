function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = NCGmodel_sim.static_g1_tt(T, y, x, params);
end
g1 = zeros(4, 4);
g1(1,1)=T(13)-T(8)*params(1)*T(13);
g1(1,2)=(-(T(5)*params(1)*T(7)*params(4)*exp(y(4))*getPowerDeriv(y(2),params(4)-1,1)));
g1(1,3)=T(15)-(T(8)*params(1)*T(15)+T(5)*params(1)*T(6)*T(16));
g1(1,4)=(-(T(5)*params(1)*T(6)*T(7)));
g1(2,1)=1;
g1(2,2)=(-((1-y(3))*T(10)*exp(y(4))*(1-params(4))*params(2)/(1-params(2))*T(14)));
g1(2,3)=(-((1-y(3))*exp(y(4))*(1-params(4))*params(2)/(1-params(2))*T(9)*getPowerDeriv(y(3),(-params(4)),1)-exp(y(4))*(1-params(4))*params(2)/(1-params(2))*T(9)*T(10)));
g1(2,4)=(-T(11));
g1(3,1)=1;
g1(3,2)=1-(1-params(3)+T(7)*exp(y(4))*T(14));
g1(3,3)=(-(exp(y(4))*T(9)*T(16)));
g1(3,4)=(-(T(7)*exp(y(4))*T(9)));
g1(4,4)=1-params(6);

end
