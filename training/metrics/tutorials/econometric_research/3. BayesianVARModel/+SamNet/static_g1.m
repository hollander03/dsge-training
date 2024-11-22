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
    T = SamNet.static_g1_tt(T, y, x, params);
end
g1 = zeros(19, 19);
g1(1,2)=1;
g1(1,7)=(-y(8));
g1(1,8)=(-y(7));
g1(1,10)=1-y(12);
g1(1,12)=(-y(10));
g1(2,12)=(-params(1));
g1(3,2)=(-(params(6)*y(17)*(1-params(39))/(y(5)*(1-params(39)))));
g1(3,5)=(-(params(6)*y(17)*(-((y(2)-y(2)*params(39))*(1-params(39))))/(y(5)*(1-params(39))*y(5)*(1-params(39)))));
g1(3,9)=1-params(1);
g1(3,17)=(-(params(6)*(y(2)-y(2)*params(39))/(y(5)*(1-params(39)))));
g1(4,2)=(-(params(7)/(1-y(7))));
g1(4,7)=(-((y(2)-y(2)*params(39))/(1-params(39))*params(7)/((1-y(7))*(1-y(7)))));
g1(4,8)=1;
g1(5,3)=1;
g1(5,7)=y(8);
g1(5,8)=y(7);
g1(5,11)=y(13)-1;
g1(5,13)=y(11);
g1(5,15)=(-1);
g1(6,6)=(-(T(3)*y(18)*getPowerDeriv(y(6),params(8),1)));
g1(6,7)=(-(T(2)*getPowerDeriv(y(7),1-params(8),1)));
g1(6,15)=1;
g1(6,18)=(-(T(1)*T(3)));
g1(7,6)=(-(params(4)*y(9)/y(13)));
g1(7,7)=y(8)*params(5);
g1(7,8)=y(7)*params(5);
g1(7,9)=(-(y(6)*params(4)*1/y(13)));
g1(7,11)=1;
g1(7,13)=(-(y(6)*params(4)*(-y(9))/(y(13)*y(13))));
g1(8,6)=(-(params(2)*(-(y(15)*params(8)))/(y(6)*y(6))));
g1(8,9)=1-(params(4)*1/y(13)+params(2)*(1-params(4)));
g1(8,13)=(-(params(4)*(-y(9))/(y(13)*y(13))));
g1(8,15)=(-(params(2)*params(8)/y(6)));
g1(9,7)=(-(y(8)*(1+params(5)*(1-y(13)*params(2)))));
g1(9,8)=(-(y(7)*(1+params(5)*(1-y(13)*params(2)))));
g1(9,13)=(-(y(8)*y(7)*params(5)*(-params(2))));
g1(9,15)=1-params(8);
g1(10,4)=1;
g1(10,10)=y(12)-1;
g1(10,11)=1-y(13);
g1(10,12)=y(10);
g1(10,13)=(-y(11));
g1(11,10)=1;
g1(11,11)=(-(1-y(16)));
g1(11,16)=y(11);
g1(11,19)=1;
g1(12,12)=(-(params(3)*(-(1-y(16)))));
g1(12,13)=(-params(3));
g1(12,16)=1-y(12)*params(3);
g1(13,5)=1;
g1(13,6)=1;
g1(14,11)=(-(params(33)*1/y(15)/(params(28)/params(32))*T(5)));
g1(14,15)=(-(params(33)*T(5)*(-y(11))/(y(15)*y(15))/(params(28)/params(32))));
g1(14,16)=1;
g1(15,12)=1;
g1(15,13)=(-1);
g1(15,14)=1;
g1(16,1)=1;
g1(16,2)=(-1);
g1(16,3)=(-1);
g1(16,4)=(-1);
g1(17,17)=1/y(17)-params(9)*1/y(17);
g1(18,19)=1-params(11);
g1(19,18)=1/y(18)-params(10)*1/y(18);

end
