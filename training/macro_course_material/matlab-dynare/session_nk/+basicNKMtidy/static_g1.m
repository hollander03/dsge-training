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
    T = basicNKMtidy.static_g1_tt(T, y, x, params);
end
g1 = zeros(17, 17);
g1(1,1)=1;
g1(1,2)=(-1);
g1(2,4)=T(1);
g1(3,2)=(-(params(3)/params(4)));
g1(3,3)=1;
g1(3,5)=params(1)*1/params(4);
g1(3,12)=(-1);
g1(4,6)=1;
g1(5,4)=(-1);
g1(5,5)=1;
g1(5,6)=(-1);
g1(6,6)=1-params(1);
g1(6,7)=(-((1-params(6))*(1-params(6)*params(1))/params(6)));
g1(6,10)=(-1);
g1(7,1)=(-(params(3)+params(5)));
g1(7,7)=1;
g1(7,9)=1+params(5);
g1(8,7)=1;
g1(8,8)=1;
g1(9,5)=1-params(11);
g1(9,6)=(-((1-params(11))*params(7)));
g1(9,11)=(-1);
g1(9,16)=(-((1-params(11))*params(8)));
g1(10,9)=1-params(9);
g1(11,10)=1-params(10);
g1(12,11)=1-params(12);
g1(13,13)=1;
g1(13,14)=(-1);
g1(14,9)=(-(1+params(5)));
g1(14,13)=params(3)+params(5);
g1(15,15)=T(1);
g1(16,1)=(-1);
g1(16,13)=1;
g1(16,16)=1;
g1(17,3)=(-1);
g1(17,12)=1;
g1(17,17)=1;

end
