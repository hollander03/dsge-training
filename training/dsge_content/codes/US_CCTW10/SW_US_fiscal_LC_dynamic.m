function [residual, g1, g2, g3] = SW_US_fiscal_LC_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(62, 1);
T58 = 1/(params(10)/(1-params(10)));
T74 = 1/(1+params(42)*params(40));
T79 = params(40)^2;
T81 = T79*params(12);
T94 = params(15)/params(40);
T99 = (1-T94)/(params(14)*(1+T94));
T111 = (1-params(13))/(params(45)+1-params(13));
T127 = (params(14)-1)*params(54)/(params(14)*(1+T94));
T139 = 1/params(52);
T170 = 1/(1-T94);
T173 = T94/(1-T94);
T295 = 1/(1+params(42)*params(40)*params(21));
T310 = (1-params(22))*(1-params(42)*params(40)*params(22))/params(22)/(1+(params(18)-1)*params(3));
T319 = params(42)*params(40)/(1+params(42)*params(40));
T347 = (1-params(20))*(1-params(42)*params(40)*params(20))/((1+params(42)*params(40))*params(20))*1/(1+(params(24)-1)*params(1));
lhs =y(77);
rhs =y(58)*4;
residual(1)= lhs-rhs;
lhs =y(78);
rhs =y(68);
residual(2)= lhs-rhs;
lhs =y(79);
rhs =4*y(56);
residual(3)= lhs-rhs;
lhs =y(80);
rhs =y(54)-y(43);
residual(4)= lhs-rhs;
lhs =y(81);
rhs =y(54);
residual(5)= lhs-rhs;
lhs =y(77);
rhs =params(62)*y(23)+y(78)*params(66)+params(67)*y(24)+y(80)*params(75)+params(76)*y(25);
residual(6)= lhs-rhs;
lhs =y(59);
rhs =params(9)*y(38)+(1-params(9))*y(45);
residual(7)= lhs-rhs;
lhs =y(37);
rhs =y(38)*T58;
residual(8)= lhs-rhs;
lhs =y(38);
rhs =y(45)+y(44)-y(39);
residual(9)= lhs-rhs;
lhs =y(39);
rhs =y(37)+y(16);
residual(10)= lhs-rhs;
lhs =y(42);
rhs =T74*(y(3)+params(42)*params(40)*y(92)+1/T81*y(40))+y(62);
residual(11)= lhs-rhs;
lhs =y(40);
rhs =(-y(46))+y(60)*1/T99+params(45)/(params(45)+1-params(13))*y(90)+T111*y(91);
residual(12)= lhs-rhs;
lhs =y(74);
rhs =y(60)+T94/(1+T94)*y(21)+1/(1+T94)*y(101)+T127*(y(44)-y(93))-y(46)*T99;
residual(13)= lhs-rhs;
lhs =y(73);
rhs =(y(45)+y(44))*params(54)-T139*y(76);
residual(14)= lhs-rhs;
lhs =y(41);
rhs =y(74)*(1-params(60))+y(73)*params(60);
residual(15)= lhs-rhs;
lhs =y(43);
rhs =params(52)*y(41)+y(42)*params(51)+y(61)+y(37)*params(53);
residual(16)= lhs-rhs;
lhs =y(43);
rhs =params(18)*(y(59)+params(9)*y(39)+(1-params(9))*y(44));
residual(17)= lhs-rhs;
lhs =y(45);
rhs =y(44)*params(23)+y(74)*T170-y(21)*T173;
residual(18)= lhs-rhs;
lhs =y(66);
rhs =y(16)*(1-params(47))+y(42)*params(47)+y(62)*T81*params(47);
residual(19)= lhs-rhs;
lhs =y(75);
rhs =params(43)*(y(61)+1/params(44)*y(22)-y(76));
residual(20)= lhs-rhs;
lhs =y(76);
rhs =y(22)*params(58)+y(61)*params(59);
residual(21)= lhs-rhs;
lhs =y(47);
rhs =params(9)*y(49)+(1-params(9))*y(57)-y(59);
residual(22)= lhs-rhs;
lhs =y(48);
rhs =T58*y(49);
residual(23)= lhs-rhs;
lhs =y(49);
rhs =y(57)+y(55)-y(50);
residual(24)= lhs-rhs;
lhs =y(50);
rhs =y(48)+y(17);
residual(25)= lhs-rhs;
lhs =y(67);
rhs =(1-params(47))*y(17)+params(47)*y(53)+y(62)*params(12)*T79*params(47);
residual(26)= lhs-rhs;
lhs =y(53);
rhs =y(62)+T74*(y(5)+params(42)*params(40)*y(96)+1/T81*y(51));
residual(27)= lhs-rhs;
lhs =y(51);
rhs =y(60)*1/T99+(-y(58))+y(98)+params(45)/(params(45)+1-params(13))*y(94)+T111*y(95);
residual(28)= lhs-rhs;
lhs =y(70);
rhs =y(60)+T94/(1+T94)*y(18)+1/(1+T94)*y(100)+T127*(y(55)-y(97))-T99*(y(58)-y(98));
residual(29)= lhs-rhs;
lhs =y(69);
rhs =params(54)*(y(57)+y(55))-T139*y(72);
residual(30)= lhs-rhs;
lhs =y(52);
rhs =(1-params(60))*y(70)+params(60)*y(69);
residual(31)= lhs-rhs;
lhs =y(54);
rhs =y(61)+params(52)*y(52)+params(51)*y(53)+params(53)*y(48);
residual(32)= lhs-rhs;
lhs =y(54);
rhs =params(18)*(y(59)+params(9)*y(50)+(1-params(9))*y(55));
residual(33)= lhs-rhs;
lhs =y(56);
rhs =T295*(params(42)*params(40)*y(98)+params(21)*y(7)+y(47)*T310)+y(64);
residual(34)= lhs-rhs;
lhs =y(57);
rhs =T74*y(8)+T319*y(99)+y(7)*params(19)/(1+params(42)*params(40))-y(56)*(1+params(42)*params(40)*params(19))/(1+params(42)*params(40))+y(98)*T319+T347*(params(23)*y(55)+T170*y(70)-T173*y(18)-y(57))+y(65);
residual(35)= lhs-rhs;
lhs =y(71);
rhs =params(43)*(y(61)+1/params(44)*y(19)-y(72));
residual(36)= lhs-rhs;
lhs =y(72);
rhs =y(61)*params(59)+params(58)*y(19)+params(32)*y(20)+x(it_, 8);
residual(37)= lhs-rhs;
lhs =y(59);
rhs =params(30)*y(9)+x(it_, 1);
residual(38)= lhs-rhs;
lhs =y(60);
rhs =params(31)*y(10)+x(it_, 2);
residual(39)= lhs-rhs;
lhs =y(61);
rhs =params(33)*y(11)+x(it_, 9)+x(it_, 3);
residual(40)= lhs-rhs;
lhs =y(62);
rhs =params(34)*y(12)+x(it_, 4);
residual(41)= lhs-rhs;
lhs =y(63);
rhs =params(35)*y(13)+x(it_, 5);
residual(42)= lhs-rhs;
lhs =y(64);
rhs =params(36)*y(14)+y(36)-params(8)*y(2);
residual(43)= lhs-rhs;
lhs =y(36);
rhs =x(it_, 6);
residual(44)= lhs-rhs;
lhs =y(65);
rhs =params(37)*y(15)+y(35)-params(7)*y(1);
residual(45)= lhs-rhs;
lhs =y(35);
rhs =x(it_, 7);
residual(46)= lhs-rhs;
lhs =y(84);
rhs =y(97)-y(55);
residual(47)= lhs-rhs;
lhs =y(86);
rhs =params(9)*y(38)+(1-params(9))*y(45)-y(59);
residual(48)= lhs-rhs;
lhs =y(31);
rhs =y(54)-y(6)+params(38);
residual(49)= lhs-rhs;
lhs =y(32);
rhs =params(38)+y(52)-y(4);
residual(50)= lhs-rhs;
lhs =y(33);
rhs =params(38)+y(53)-y(5);
residual(51)= lhs-rhs;
lhs =y(34);
rhs =params(38)+y(57)-y(8);
residual(52)= lhs-rhs;
lhs =y(30);
rhs =y(56)+params(5);
residual(53)= lhs-rhs;
lhs =y(87);
rhs =4*y(30);
residual(54)= lhs-rhs;
lhs =y(68);
rhs =y(56)+y(7)+y(83)+y(27);
residual(55)= lhs-rhs;
lhs =y(82);
rhs =y(7);
residual(56)= lhs-rhs;
lhs =y(83);
rhs =y(26);
residual(57)= lhs-rhs;
lhs =y(29);
rhs =y(58)+params(56);
residual(58)= lhs-rhs;
lhs =y(89);
rhs =4*y(29);
residual(59)= lhs-rhs;
lhs =y(28);
rhs =y(55)+params(4);
residual(60)= lhs-rhs;
lhs =y(85);
rhs =y(89)-y(87);
residual(61)= lhs-rhs;
lhs =y(88);
rhs =4*y(31);
residual(62)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(62, 110);

  %
  % Jacobian matrix
  %

  g1(1,58)=(-4);
  g1(1,77)=1;
  g1(2,68)=(-1);
  g1(2,78)=1;
  g1(3,56)=(-4);
  g1(3,79)=1;
  g1(4,43)=1;
  g1(4,54)=(-1);
  g1(4,80)=1;
  g1(5,54)=(-1);
  g1(5,81)=1;
  g1(6,23)=(-params(62));
  g1(6,77)=1;
  g1(6,24)=(-params(67));
  g1(6,78)=(-params(66));
  g1(6,25)=(-params(76));
  g1(6,80)=(-params(75));
  g1(7,38)=(-params(9));
  g1(7,45)=(-(1-params(9)));
  g1(7,59)=1;
  g1(8,37)=1;
  g1(8,38)=(-T58);
  g1(9,38)=1;
  g1(9,39)=1;
  g1(9,44)=(-1);
  g1(9,45)=(-1);
  g1(10,37)=(-1);
  g1(10,39)=1;
  g1(10,16)=(-1);
  g1(11,40)=(-(T74*1/T81));
  g1(11,3)=(-T74);
  g1(11,42)=1;
  g1(11,92)=(-(params(42)*params(40)*T74));
  g1(11,62)=(-1);
  g1(12,90)=(-(params(45)/(params(45)+1-params(13))));
  g1(12,40)=1;
  g1(12,91)=(-T111);
  g1(12,46)=1;
  g1(12,60)=(-(1/T99));
  g1(13,44)=(-T127);
  g1(13,93)=T127;
  g1(13,46)=T99;
  g1(13,60)=(-1);
  g1(13,21)=(-(T94/(1+T94)));
  g1(13,74)=1;
  g1(13,101)=(-(1/(1+T94)));
  g1(14,44)=(-params(54));
  g1(14,45)=(-params(54));
  g1(14,73)=1;
  g1(14,76)=T139;
  g1(15,41)=1;
  g1(15,73)=(-params(60));
  g1(15,74)=(-(1-params(60)));
  g1(16,37)=(-params(53));
  g1(16,41)=(-params(52));
  g1(16,42)=(-params(51));
  g1(16,43)=1;
  g1(16,61)=(-1);
  g1(17,39)=(-(params(9)*params(18)));
  g1(17,43)=1;
  g1(17,44)=(-((1-params(9))*params(18)));
  g1(17,59)=(-params(18));
  g1(18,44)=(-params(23));
  g1(18,45)=1;
  g1(18,21)=T173;
  g1(18,74)=(-T170);
  g1(19,42)=(-params(47));
  g1(19,62)=(-(T81*params(47)));
  g1(19,16)=(-(1-params(47)));
  g1(19,66)=1;
  g1(20,61)=(-params(43));
  g1(20,22)=(-(params(43)*1/params(44)));
  g1(20,75)=1;
  g1(20,76)=params(43);
  g1(21,61)=(-params(59));
  g1(21,22)=(-params(58));
  g1(21,76)=1;
  g1(22,47)=1;
  g1(22,49)=(-params(9));
  g1(22,57)=(-(1-params(9)));
  g1(22,59)=1;
  g1(23,48)=1;
  g1(23,49)=(-T58);
  g1(24,49)=1;
  g1(24,50)=1;
  g1(24,55)=(-1);
  g1(24,57)=(-1);
  g1(25,48)=(-1);
  g1(25,50)=1;
  g1(25,17)=(-1);
  g1(26,53)=(-params(47));
  g1(26,62)=(-(params(12)*T79*params(47)));
  g1(26,17)=(-(1-params(47)));
  g1(26,67)=1;
  g1(27,51)=(-(T74*1/T81));
  g1(27,5)=(-T74);
  g1(27,53)=1;
  g1(27,96)=(-(params(42)*params(40)*T74));
  g1(27,62)=(-1);
  g1(28,94)=(-(params(45)/(params(45)+1-params(13))));
  g1(28,51)=1;
  g1(28,95)=(-T111);
  g1(28,98)=(-1);
  g1(28,58)=1;
  g1(28,60)=(-(1/T99));
  g1(29,55)=(-T127);
  g1(29,97)=T127;
  g1(29,98)=(-T99);
  g1(29,58)=T99;
  g1(29,60)=(-1);
  g1(29,18)=(-(T94/(1+T94)));
  g1(29,70)=1;
  g1(29,100)=(-(1/(1+T94)));
  g1(30,55)=(-params(54));
  g1(30,57)=(-params(54));
  g1(30,69)=1;
  g1(30,72)=T139;
  g1(31,52)=1;
  g1(31,69)=(-params(60));
  g1(31,70)=(-(1-params(60)));
  g1(32,48)=(-params(53));
  g1(32,52)=(-params(52));
  g1(32,53)=(-params(51));
  g1(32,54)=1;
  g1(32,61)=(-1);
  g1(33,50)=(-(params(9)*params(18)));
  g1(33,54)=1;
  g1(33,55)=(-((1-params(9))*params(18)));
  g1(33,59)=(-params(18));
  g1(34,47)=(-(T295*T310));
  g1(34,7)=(-(params(21)*T295));
  g1(34,56)=1;
  g1(34,98)=(-(params(42)*params(40)*T295));
  g1(34,64)=(-1);
  g1(35,55)=(-(params(23)*T347));
  g1(35,7)=(-(params(19)/(1+params(42)*params(40))));
  g1(35,56)=(1+params(42)*params(40)*params(19))/(1+params(42)*params(40));
  g1(35,98)=(-T319);
  g1(35,8)=(-T74);
  g1(35,57)=1-(-T347);
  g1(35,99)=(-T319);
  g1(35,65)=(-1);
  g1(35,18)=(-(T347*(-T173)));
  g1(35,70)=(-(T170*T347));
  g1(36,61)=(-params(43));
  g1(36,19)=(-(params(43)*1/params(44)));
  g1(36,71)=1;
  g1(36,72)=params(43);
  g1(37,61)=(-params(59));
  g1(37,19)=(-params(58));
  g1(37,20)=(-params(32));
  g1(37,72)=1;
  g1(37,109)=(-1);
  g1(38,9)=(-params(30));
  g1(38,59)=1;
  g1(38,102)=(-1);
  g1(39,10)=(-params(31));
  g1(39,60)=1;
  g1(39,103)=(-1);
  g1(40,11)=(-params(33));
  g1(40,61)=1;
  g1(40,104)=(-1);
  g1(40,110)=(-1);
  g1(41,12)=(-params(34));
  g1(41,62)=1;
  g1(41,105)=(-1);
  g1(42,13)=(-params(35));
  g1(42,63)=1;
  g1(42,106)=(-1);
  g1(43,2)=params(8);
  g1(43,36)=(-1);
  g1(43,14)=(-params(36));
  g1(43,64)=1;
  g1(44,36)=1;
  g1(44,107)=(-1);
  g1(45,1)=params(7);
  g1(45,35)=(-1);
  g1(45,15)=(-params(37));
  g1(45,65)=1;
  g1(46,35)=1;
  g1(46,108)=(-1);
  g1(47,55)=1;
  g1(47,97)=(-1);
  g1(47,84)=1;
  g1(48,38)=(-params(9));
  g1(48,45)=(-(1-params(9)));
  g1(48,59)=1;
  g1(48,86)=1;
  g1(49,31)=1;
  g1(49,6)=1;
  g1(49,54)=(-1);
  g1(50,32)=1;
  g1(50,4)=1;
  g1(50,52)=(-1);
  g1(51,33)=1;
  g1(51,5)=1;
  g1(51,53)=(-1);
  g1(52,34)=1;
  g1(52,8)=1;
  g1(52,57)=(-1);
  g1(53,30)=1;
  g1(53,56)=(-1);
  g1(54,30)=(-4);
  g1(54,87)=1;
  g1(55,7)=(-1);
  g1(55,56)=(-1);
  g1(55,68)=1;
  g1(55,27)=(-1);
  g1(55,83)=(-1);
  g1(56,7)=(-1);
  g1(56,82)=1;
  g1(57,26)=(-1);
  g1(57,83)=1;
  g1(58,29)=1;
  g1(58,58)=(-1);
  g1(59,29)=(-4);
  g1(59,89)=1;
  g1(60,28)=1;
  g1(60,55)=(-1);
  g1(61,85)=1;
  g1(61,87)=1;
  g1(61,89)=(-1);
  g1(62,31)=(-4);
  g1(62,88)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],62,12100);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],62,1331000);
end
end
end
end
