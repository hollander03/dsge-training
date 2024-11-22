function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = SamNet.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(19, 39);
g1(1,13)=1;
g1(1,4)=(-y(20));
g1(1,16)=y(20);
g1(1,18)=(-y(19));
g1(1,19)=(-y(18));
g1(1,20)=y(16)-y(4);
g1(1,6)=(-y(8));
g1(1,21)=1;
g1(1,8)=(-y(6));
g1(2,1)=(-(y(23)*params(1)*(-params(39))/(y(31)-y(13)*params(39))));
g1(2,13)=(-(y(23)*T(11)));
g1(2,31)=(-(y(23)*params(1)*(-(y(13)-params(39)*y(1)))/((y(31)-y(13)*params(39))*(y(31)-y(13)*params(39)))));
g1(2,23)=(-T(1));
g1(3,1)=(-(params(6)*y(28)*(-params(39))/(y(16)*(1-params(39)))+y(34)*params(1)*(-params(39))/(y(31)-y(13)*params(39))));
g1(3,13)=(-(params(6)*y(28)*1/(y(16)*(1-params(39)))+y(34)*T(11)));
g1(3,31)=(-(y(34)*params(1)*(-(y(13)-params(39)*y(1)))/((y(31)-y(13)*params(39))*(y(31)-y(13)*params(39)))));
g1(3,16)=(-(params(6)*y(28)*(-((y(13)-params(39)*y(1))*(1-params(39))))/(y(16)*(1-params(39))*y(16)*(1-params(39)))));
g1(3,20)=1;
g1(3,34)=(-T(1));
g1(3,28)=(-(params(6)*(y(13)-params(39)*y(1))/(y(16)*(1-params(39)))));
g1(4,1)=(-(params(7)/(1-y(18))*(-params(39))/(1-params(39))));
g1(4,13)=(-(params(7)/(1-y(18))*1/(1-params(39))));
g1(4,18)=(-((y(13)-params(39)*y(1))/(1-params(39))*params(7)/((1-y(18))*(1-y(18)))));
g1(4,19)=1;
g1(5,14)=1;
g1(5,5)=(-y(20));
g1(5,17)=y(20);
g1(5,18)=y(19);
g1(5,19)=y(18);
g1(5,20)=y(17)-y(5);
g1(5,7)=y(24)+params(37)/(2*params(28))*(-(2*(y(22)-y(7))));
g1(5,22)=params(37)/(2*params(28))*2*(y(22)-y(7))-1;
g1(5,24)=y(7);
g1(5,26)=(-1);
g1(6,5)=(-(T(5)*y(29)*getPowerDeriv(y(5),params(8),1)));
g1(6,18)=(-(T(4)*getPowerDeriv(y(18),1-params(8),1)));
g1(6,26)=1;
g1(6,29)=(-(T(3)*T(5)));
g1(7,17)=(-(params(4)*y(34)/y(35)));
g1(7,18)=y(19)*params(5);
g1(7,19)=y(18)*params(5);
g1(7,34)=(-(y(17)*params(4)*1/y(35)));
g1(7,22)=1;
g1(7,35)=(-(y(17)*params(4)*(-y(34))/(y(35)*y(35))));
g1(8,2)=(-(T(7)*params(2)*(-params(39))/(y(32)-params(39)*y(14))));
g1(8,14)=(-(T(7)*T(12)));
g1(8,32)=(-(T(7)*params(2)*(-(y(14)-params(39)*y(2)))/((y(32)-params(39)*y(14))*(y(32)-params(39)*y(14)))));
g1(8,17)=(-(T(6)*(-(params(8)*y(36)))/(y(17)*y(17))));
g1(8,20)=1;
g1(8,34)=(-(params(4)*1/y(35)+T(6)*(1-params(4))-(y(22)-y(7))*params(4)*params(37)/params(28)*1/y(35)));
g1(8,7)=(-T(8));
g1(8,22)=T(8);
g1(8,35)=(-(params(4)*(-y(34))/(y(35)*y(35))-(y(22)-y(7))*params(4)*params(37)/params(28)*(-y(34))/(y(35)*y(35))));
g1(8,36)=(-(T(6)*params(8)/y(17)));
g1(9,2)=(-(y(19)*y(18)*params(5)*(-(y(35)*params(2)*(-params(39))/(y(32)-params(39)*y(14))))));
g1(9,14)=(-(y(19)*y(18)*params(5)*(-(y(35)*T(12)))));
g1(9,32)=(-(y(19)*y(18)*params(5)*(-(y(35)*params(2)*(-(y(14)-params(39)*y(2)))/((y(32)-params(39)*y(14))*(y(32)-params(39)*y(14)))))));
g1(9,18)=(-(y(19)*(1+params(5)*(1-y(35)*T(6)))));
g1(9,19)=(-(y(18)*(1+params(5)*(1-y(35)*T(6)))));
g1(9,35)=(-(y(19)*y(18)*params(5)*(-T(6))));
g1(9,26)=1-params(8);
g1(10,15)=1;
g1(10,6)=y(8);
g1(10,21)=(-1);
g1(10,7)=params(38)/(2*params(28))*(-(2*(y(22)-y(7))))-y(24);
g1(10,22)=1+params(38)/(2*params(28))*2*(y(22)-y(7));
g1(10,8)=y(6);
g1(10,24)=(-y(7));
g1(11,21)=1;
g1(11,22)=(-(1-y(27)));
g1(11,27)=y(22);
g1(11,30)=1;
g1(12,3)=(-((y(35)-y(23)*(1-y(27)))*params(3)*(-params(39))/(y(33)-params(39)*y(15))));
g1(12,15)=(-((y(35)-y(23)*(1-y(27)))*params(3)*(y(33)-params(39)*y(15)-(y(15)-params(39)*y(3))*(-params(39)))/((y(33)-params(39)*y(15))*(y(33)-params(39)*y(15)))));
g1(12,33)=(-((y(35)-y(23)*(1-y(27)))*params(3)*(-(y(15)-params(39)*y(3)))/((y(33)-params(39)*y(15))*(y(33)-params(39)*y(15)))));
g1(12,7)=(-(params(38)/params(28)));
g1(12,22)=params(38)/params(28);
g1(12,23)=(-(T(9)*(-(1-y(27)))));
g1(12,35)=(-T(9));
g1(12,27)=1-y(23)*T(9);
g1(13,16)=1;
g1(13,17)=1;
g1(14,22)=(-(params(33)*1/y(26)/(params(28)/params(32))*T(13)));
g1(14,26)=(-(params(33)*T(13)*(-y(22))/(y(26)*y(26))/(params(28)/params(32))));
g1(14,27)=1;
g1(15,23)=1;
g1(15,24)=(-1);
g1(15,25)=1;
g1(16,12)=1;
g1(16,13)=(-1);
g1(16,14)=(-1);
g1(16,15)=(-1);
g1(17,9)=(-(params(9)*1/y(9)));
g1(17,28)=1/y(28);
g1(17,37)=(-1);
g1(18,11)=(-params(11));
g1(18,30)=1;
g1(18,39)=(-1);
g1(19,10)=(-(params(10)*1/y(10)));
g1(19,29)=1/y(29);
g1(19,38)=(-1);

end
