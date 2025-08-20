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
    T = basicrbc2015.static_g1_tt(T, y, x, params);
end
g1 = zeros(7, 7);
g1(1,1)=1;
g1(1,2)=(-(1-T(2)));
g1(1,4)=(-T(2));
g1(2,6)=1/params(5);
g1(3,1)=(-1);
g1(3,2)=params(5);
g1(3,3)=1;
g1(4,1)=(-(params(1)*1/T(1)));
g1(4,5)=params(1)*1/T(1);
g1(4,6)=1;
g1(5,4)=(-params(3));
g1(5,5)=1-(1-params(3));
g1(6,1)=1;
g1(6,3)=(-(1-params(1)));
g1(6,5)=(-params(1));
g1(6,7)=(-1);
g1(7,7)=1-params(4);

end
