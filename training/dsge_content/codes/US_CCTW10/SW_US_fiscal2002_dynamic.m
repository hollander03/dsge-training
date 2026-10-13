function [residual, g1, g2, g3] = SW_US_fiscal2002_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(51, 1);
T58 = 1/(params(10)/(1-params(10)));
T74 = 1/(1+params(37)*params(35));
T79 = params(35)^2;
T81 = T79*params(12);
T94 = params(15)/params(35);
T99 = (1-T94)/(params(14)*(1+T94));
T111 = (1-params(13))/(params(40)+1-params(13));
T127 = (params(14)-1)*params(49)/(params(14)*(1+T94));
T156 = 1/(1-T94);
T159 = T94/(1-T94);
T245 = 1/(1+params(37)*params(35)*params(21));
T260 = (1-params(22))*(1-params(37)*params(35)*params(22))/params(22)/(1+(params(18)-1)*params(3));
T269 = params(37)*params(35)/(1+params(37)*params(35));
T297 = (1-params(20))*(1-params(37)*params(35)*params(20))/((1+params(37)*params(35))*params(20))*1/(1+(params(24)-1)*params(1));
lhs =y(65);
rhs =y(54)*4;
residual(1)= lhs-rhs;
lhs =y(66);
rhs =y(64);
residual(2)= lhs-rhs;
lhs =y(67);
rhs =4*y(52);
residual(3)= lhs-rhs;
lhs =y(68);
rhs =y(50)-y(39);
residual(4)= lhs-rhs;
lhs =y(69);
rhs =y(50);
residual(5)= lhs-rhs;
lhs =y(65);
rhs =params(52)*y(19)+y(66)*params(56)+params(57)*y(20)+y(68)*params(65)+params(66)*y(21);
residual(6)= lhs-rhs;
lhs =y(55);
rhs =params(9)*y(34)+(1-params(9))*y(41);
residual(7)= lhs-rhs;
lhs =y(33);
rhs =y(34)*T58;
residual(8)= lhs-rhs;
lhs =y(34);
rhs =y(41)+y(40)-y(35);
residual(9)= lhs-rhs;
lhs =y(35);
rhs =y(33)+y(17);
residual(10)= lhs-rhs;
lhs =y(38);
rhs =T74*(y(4)+params(37)*params(35)*y(78)+1/T81*y(36))+y(58);
residual(11)= lhs-rhs;
lhs =y(36);
rhs =(-y(42))+y(56)*1/T99+params(40)/(params(40)+1-params(13))*y(75)+T111*y(76);
residual(12)= lhs-rhs;
lhs =y(37);
rhs =y(56)+T94/(1+T94)*y(3)+1/(1+T94)*y(77)+T127*(y(40)-y(79))-y(42)*T99;
residual(13)= lhs-rhs;
lhs =y(39);
rhs =y(37)*params(47)+y(38)*params(46)+y(57)+y(33)*params(48);
residual(14)= lhs-rhs;
lhs =y(39);
rhs =params(18)*(y(55)+params(9)*y(35)+(1-params(9))*y(40));
residual(15)= lhs-rhs;
lhs =y(41);
rhs =y(40)*params(23)+y(37)*T156-y(3)*T159;
residual(16)= lhs-rhs;
lhs =y(62);
rhs =y(17)*(1-params(42))+y(38)*params(42)+y(58)*T81*params(42);
residual(17)= lhs-rhs;
lhs =y(43);
rhs =params(9)*y(45)+(1-params(9))*y(53)-y(55);
residual(18)= lhs-rhs;
lhs =y(44);
rhs =T58*y(45);
residual(19)= lhs-rhs;
lhs =y(45);
rhs =y(53)+y(51)-y(46);
residual(20)= lhs-rhs;
lhs =y(46);
rhs =y(44)+y(18);
residual(21)= lhs-rhs;
lhs =y(49);
rhs =y(58)+T74*(y(6)+params(37)*params(35)*y(83)+1/T81*y(47));
residual(22)= lhs-rhs;
lhs =y(47);
rhs =y(56)*1/T99+(-y(54))+y(85)+params(40)/(params(40)+1-params(13))*y(80)+T111*y(81);
residual(23)= lhs-rhs;
lhs =y(48);
rhs =y(56)+T94/(1+T94)*y(5)+1/(1+T94)*y(82)+T127*(y(51)-y(84))-T99*(y(54)-y(85));
residual(24)= lhs-rhs;
lhs =y(50);
rhs =y(57)+params(47)*y(48)+params(46)*y(49)+params(48)*y(44);
residual(25)= lhs-rhs;
lhs =y(50);
rhs =params(18)*(y(55)+params(9)*y(46)+(1-params(9))*y(51));
residual(26)= lhs-rhs;
lhs =y(52);
rhs =T245*(params(37)*params(35)*y(85)+params(21)*y(8)+y(43)*T260)+y(60);
residual(27)= lhs-rhs;
lhs =y(53);
rhs =T74*y(9)+T269*y(86)+y(8)*params(19)/(1+params(37)*params(35))-y(52)*(1+params(37)*params(35)*params(19))/(1+params(37)*params(35))+y(85)*T269+T297*(params(23)*y(51)+T156*y(48)-T159*y(5)-y(53))+y(61);
residual(28)= lhs-rhs;
lhs =y(55);
rhs =params(26)*y(10)+x(it_, 1);
residual(29)= lhs-rhs;
lhs =y(56);
rhs =params(27)*y(11)+x(it_, 2);
residual(30)= lhs-rhs;
lhs =y(57);
rhs =params(28)*y(12)+x(it_, 8)+x(it_, 3);
residual(31)= lhs-rhs;
lhs =y(58);
rhs =params(29)*y(13)+x(it_, 4);
residual(32)= lhs-rhs;
lhs =y(59);
rhs =params(30)*y(14)+x(it_, 5);
residual(33)= lhs-rhs;
lhs =y(60);
rhs =params(31)*y(15)+y(32)-params(8)*y(2);
residual(34)= lhs-rhs;
lhs =y(32);
rhs =x(it_, 6);
residual(35)= lhs-rhs;
lhs =y(61);
rhs =params(32)*y(16)+y(31)-params(7)*y(1);
residual(36)= lhs-rhs;
lhs =y(31);
rhs =x(it_, 7);
residual(37)= lhs-rhs;
lhs =y(63);
rhs =(1-params(42))*y(18)+params(42)*y(49)+y(58)*params(12)*T79*params(42);
residual(38)= lhs-rhs;
lhs =y(27);
rhs =y(50)-y(7)+params(33);
residual(39)= lhs-rhs;
lhs =y(28);
rhs =params(33)+y(48)-y(5);
residual(40)= lhs-rhs;
lhs =y(29);
rhs =params(33)+y(49)-y(6);
residual(41)= lhs-rhs;
lhs =y(30);
rhs =params(33)+y(53)-y(9);
residual(42)= lhs-rhs;
lhs =y(26);
rhs =y(52)+params(5);
residual(43)= lhs-rhs;
lhs =y(72);
rhs =4*y(26);
residual(44)= lhs-rhs;
lhs =y(64);
rhs =y(52)+y(8)+y(71)+y(23);
residual(45)= lhs-rhs;
lhs =y(70);
rhs =y(8);
residual(46)= lhs-rhs;
lhs =y(71);
rhs =y(22);
residual(47)= lhs-rhs;
lhs =y(25);
rhs =y(54)+params(51);
residual(48)= lhs-rhs;
lhs =y(73);
rhs =4*y(25);
residual(49)= lhs-rhs;
lhs =y(24);
rhs =y(51)+params(4);
residual(50)= lhs-rhs;
lhs =y(74);
rhs =y(65)-y(67);
residual(51)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(51, 94);

  %
  % Jacobian matrix
  %

  g1(1,54)=(-4);
  g1(1,65)=1;
  g1(2,64)=(-1);
  g1(2,66)=1;
  g1(3,52)=(-4);
  g1(3,67)=1;
  g1(4,39)=1;
  g1(4,50)=(-1);
  g1(4,68)=1;
  g1(5,50)=(-1);
  g1(5,69)=1;
  g1(6,19)=(-params(52));
  g1(6,65)=1;
  g1(6,20)=(-params(57));
  g1(6,66)=(-params(56));
  g1(6,21)=(-params(66));
  g1(6,68)=(-params(65));
  g1(7,34)=(-params(9));
  g1(7,41)=(-(1-params(9)));
  g1(7,55)=1;
  g1(8,33)=1;
  g1(8,34)=(-T58);
  g1(9,34)=1;
  g1(9,35)=1;
  g1(9,40)=(-1);
  g1(9,41)=(-1);
  g1(10,33)=(-1);
  g1(10,35)=1;
  g1(10,17)=(-1);
  g1(11,36)=(-(T74*1/T81));
  g1(11,4)=(-T74);
  g1(11,38)=1;
  g1(11,78)=(-(params(37)*params(35)*T74));
  g1(11,58)=(-1);
  g1(12,75)=(-(params(40)/(params(40)+1-params(13))));
  g1(12,36)=1;
  g1(12,76)=(-T111);
  g1(12,42)=1;
  g1(12,56)=(-(1/T99));
  g1(13,3)=(-(T94/(1+T94)));
  g1(13,37)=1;
  g1(13,77)=(-(1/(1+T94)));
  g1(13,40)=(-T127);
  g1(13,79)=T127;
  g1(13,42)=T99;
  g1(13,56)=(-1);
  g1(14,33)=(-params(48));
  g1(14,37)=(-params(47));
  g1(14,38)=(-params(46));
  g1(14,39)=1;
  g1(14,57)=(-1);
  g1(15,35)=(-(params(9)*params(18)));
  g1(15,39)=1;
  g1(15,40)=(-((1-params(9))*params(18)));
  g1(15,55)=(-params(18));
  g1(16,3)=T159;
  g1(16,37)=(-T156);
  g1(16,40)=(-params(23));
  g1(16,41)=1;
  g1(17,38)=(-params(42));
  g1(17,58)=(-(T81*params(42)));
  g1(17,17)=(-(1-params(42)));
  g1(17,62)=1;
  g1(18,43)=1;
  g1(18,45)=(-params(9));
  g1(18,53)=(-(1-params(9)));
  g1(18,55)=1;
  g1(19,44)=1;
  g1(19,45)=(-T58);
  g1(20,45)=1;
  g1(20,46)=1;
  g1(20,51)=(-1);
  g1(20,53)=(-1);
  g1(21,44)=(-1);
  g1(21,46)=1;
  g1(21,18)=(-1);
  g1(22,47)=(-(T74*1/T81));
  g1(22,6)=(-T74);
  g1(22,49)=1;
  g1(22,83)=(-(params(37)*params(35)*T74));
  g1(22,58)=(-1);
  g1(23,80)=(-(params(40)/(params(40)+1-params(13))));
  g1(23,47)=1;
  g1(23,81)=(-T111);
  g1(23,85)=(-1);
  g1(23,54)=1;
  g1(23,56)=(-(1/T99));
  g1(24,5)=(-(T94/(1+T94)));
  g1(24,48)=1;
  g1(24,82)=(-(1/(1+T94)));
  g1(24,51)=(-T127);
  g1(24,84)=T127;
  g1(24,85)=(-T99);
  g1(24,54)=T99;
  g1(24,56)=(-1);
  g1(25,44)=(-params(48));
  g1(25,48)=(-params(47));
  g1(25,49)=(-params(46));
  g1(25,50)=1;
  g1(25,57)=(-1);
  g1(26,46)=(-(params(9)*params(18)));
  g1(26,50)=1;
  g1(26,51)=(-((1-params(9))*params(18)));
  g1(26,55)=(-params(18));
  g1(27,43)=(-(T245*T260));
  g1(27,8)=(-(params(21)*T245));
  g1(27,52)=1;
  g1(27,85)=(-(params(37)*params(35)*T245));
  g1(27,60)=(-1);
  g1(28,5)=(-(T297*(-T159)));
  g1(28,48)=(-(T156*T297));
  g1(28,51)=(-(params(23)*T297));
  g1(28,8)=(-(params(19)/(1+params(37)*params(35))));
  g1(28,52)=(1+params(37)*params(35)*params(19))/(1+params(37)*params(35));
  g1(28,85)=(-T269);
  g1(28,9)=(-T74);
  g1(28,53)=1-(-T297);
  g1(28,86)=(-T269);
  g1(28,61)=(-1);
  g1(29,10)=(-params(26));
  g1(29,55)=1;
  g1(29,87)=(-1);
  g1(30,11)=(-params(27));
  g1(30,56)=1;
  g1(30,88)=(-1);
  g1(31,12)=(-params(28));
  g1(31,57)=1;
  g1(31,89)=(-1);
  g1(31,94)=(-1);
  g1(32,13)=(-params(29));
  g1(32,58)=1;
  g1(32,90)=(-1);
  g1(33,14)=(-params(30));
  g1(33,59)=1;
  g1(33,91)=(-1);
  g1(34,2)=params(8);
  g1(34,32)=(-1);
  g1(34,15)=(-params(31));
  g1(34,60)=1;
  g1(35,32)=1;
  g1(35,92)=(-1);
  g1(36,1)=params(7);
  g1(36,31)=(-1);
  g1(36,16)=(-params(32));
  g1(36,61)=1;
  g1(37,31)=1;
  g1(37,93)=(-1);
  g1(38,49)=(-params(42));
  g1(38,58)=(-(params(12)*T79*params(42)));
  g1(38,18)=(-(1-params(42)));
  g1(38,63)=1;
  g1(39,27)=1;
  g1(39,7)=1;
  g1(39,50)=(-1);
  g1(40,28)=1;
  g1(40,5)=1;
  g1(40,48)=(-1);
  g1(41,29)=1;
  g1(41,6)=1;
  g1(41,49)=(-1);
  g1(42,30)=1;
  g1(42,9)=1;
  g1(42,53)=(-1);
  g1(43,26)=1;
  g1(43,52)=(-1);
  g1(44,26)=(-4);
  g1(44,72)=1;
  g1(45,8)=(-1);
  g1(45,52)=(-1);
  g1(45,64)=1;
  g1(45,23)=(-1);
  g1(45,71)=(-1);
  g1(46,8)=(-1);
  g1(46,70)=1;
  g1(47,22)=(-1);
  g1(47,71)=1;
  g1(48,25)=1;
  g1(48,54)=(-1);
  g1(49,25)=(-4);
  g1(49,73)=1;
  g1(50,24)=1;
  g1(50,51)=(-1);
  g1(51,65)=(-1);
  g1(51,67)=1;
  g1(51,74)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],51,8836);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],51,830584);
end
end
end
end
