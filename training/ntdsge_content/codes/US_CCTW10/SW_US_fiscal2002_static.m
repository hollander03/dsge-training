function [residual, g1, g2, g3] = SW_US_fiscal2002_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 51, 1);

%
% Model equations
%

T55 = 1/(params(10)/(1-params(10)));
T71 = 1/(1+params(37)*params(35));
T74 = params(35)^2;
T76 = T74*params(12);
T89 = params(15)/params(35);
T94 = (1-T89)/(params(14)*(1+T89));
T105 = (1-params(13))/(params(40)+1-params(13));
T220 = 1/(1+params(37)*params(35)*params(21));
T234 = (1-params(22))*(1-params(37)*params(35)*params(22))/params(22)/(1+(params(18)-1)*params(3));
T242 = params(37)*params(35)/(1+params(37)*params(35));
T269 = (1-params(20))*(1-params(37)*params(35)*params(20))/((1+params(37)*params(35))*params(20))*1/(1+(params(24)-1)*params(1));
lhs =y(42);
rhs =y(31)*4;
residual(1)= lhs-rhs;
lhs =y(43);
rhs =y(41);
residual(2)= lhs-rhs;
lhs =y(44);
rhs =4*y(29);
residual(3)= lhs-rhs;
lhs =y(45);
rhs =y(27)-y(16);
residual(4)= lhs-rhs;
lhs =y(46);
rhs =y(27);
residual(5)= lhs-rhs;
lhs =y(42);
rhs =y(42)*params(52)+y(43)*params(56)+y(43)*params(57)+y(45)*params(65)+y(45)*params(66);
residual(6)= lhs-rhs;
lhs =y(32);
rhs =params(9)*y(11)+(1-params(9))*y(18);
residual(7)= lhs-rhs;
lhs =y(10);
rhs =y(11)*T55;
residual(8)= lhs-rhs;
lhs =y(11);
rhs =y(18)+y(17)-y(12);
residual(9)= lhs-rhs;
lhs =y(12);
rhs =y(10)+y(39);
residual(10)= lhs-rhs;
lhs =y(15);
rhs =T71*(y(15)+y(15)*params(37)*params(35)+1/T76*y(13))+y(35);
residual(11)= lhs-rhs;
lhs =y(13);
rhs =(-y(19))+y(33)*1/T94+y(11)*params(40)/(params(40)+1-params(13))+y(13)*T105;
residual(12)= lhs-rhs;
lhs =y(14);
rhs =y(33)+y(14)*T89/(1+T89)+y(14)*1/(1+T89)-y(19)*T94;
residual(13)= lhs-rhs;
lhs =y(16);
rhs =y(14)*params(47)+y(15)*params(46)+y(34)+y(10)*params(48);
residual(14)= lhs-rhs;
lhs =y(16);
rhs =params(18)*(y(32)+params(9)*y(12)+(1-params(9))*y(17));
residual(15)= lhs-rhs;
lhs =y(18);
rhs =y(17)*params(23)+y(14)*1/(1-T89)-y(14)*T89/(1-T89);
residual(16)= lhs-rhs;
lhs =y(39);
rhs =y(39)*(1-params(42))+y(15)*params(42)+y(35)*T76*params(42);
residual(17)= lhs-rhs;
lhs =y(20);
rhs =params(9)*y(22)+(1-params(9))*y(30)-y(32);
residual(18)= lhs-rhs;
lhs =y(21);
rhs =T55*y(22);
residual(19)= lhs-rhs;
lhs =y(22);
rhs =y(30)+y(28)-y(23);
residual(20)= lhs-rhs;
lhs =y(23);
rhs =y(21)+y(40);
residual(21)= lhs-rhs;
lhs =y(26);
rhs =y(35)+T71*(y(26)+params(37)*params(35)*y(26)+1/T76*y(24));
residual(22)= lhs-rhs;
lhs =y(24);
rhs =T105*y(24)+params(40)/(params(40)+1-params(13))*y(22)+y(33)*1/T94+y(29)-y(31);
residual(23)= lhs-rhs;
lhs =y(25);
rhs =y(33)+T89/(1+T89)*y(25)+1/(1+T89)*y(25)-T94*(y(31)-y(29));
residual(24)= lhs-rhs;
lhs =y(27);
rhs =y(34)+params(47)*y(25)+params(46)*y(26)+params(48)*y(21);
residual(25)= lhs-rhs;
lhs =y(27);
rhs =params(18)*(y(32)+params(9)*y(23)+(1-params(9))*y(28));
residual(26)= lhs-rhs;
lhs =y(29);
rhs =T220*(y(29)*params(37)*params(35)+y(29)*params(21)+y(20)*T234)+y(37);
residual(27)= lhs-rhs;
lhs =y(30);
rhs =T71*y(30)+y(30)*T242+y(29)*params(19)/(1+params(37)*params(35))-y(29)*(1+params(37)*params(35)*params(19))/(1+params(37)*params(35))+y(29)*T242+T269*(params(23)*y(28)+1/(1-T89)*y(25)-T89/(1-T89)*y(25)-y(30))+y(38);
residual(28)= lhs-rhs;
lhs =y(32);
rhs =y(32)*params(26)+x(1);
residual(29)= lhs-rhs;
lhs =y(33);
rhs =y(33)*params(27)+x(2);
residual(30)= lhs-rhs;
lhs =y(34);
rhs =y(34)*params(28)+x(8)+x(3);
residual(31)= lhs-rhs;
lhs =y(35);
rhs =y(35)*params(29)+x(4);
residual(32)= lhs-rhs;
lhs =y(36);
rhs =y(36)*params(30)+x(5);
residual(33)= lhs-rhs;
lhs =y(37);
rhs =y(37)*params(31)+y(9)-y(9)*params(8);
residual(34)= lhs-rhs;
lhs =y(9);
rhs =x(6);
residual(35)= lhs-rhs;
lhs =y(38);
rhs =y(38)*params(32)+y(8)-y(8)*params(7);
residual(36)= lhs-rhs;
lhs =y(8);
rhs =x(7);
residual(37)= lhs-rhs;
lhs =y(40);
rhs =(1-params(42))*y(40)+params(42)*y(26)+y(35)*params(12)*T74*params(42);
residual(38)= lhs-rhs;
lhs =y(4);
rhs =params(33);
residual(39)= lhs-rhs;
lhs =y(5);
rhs =params(33);
residual(40)= lhs-rhs;
lhs =y(6);
rhs =params(33);
residual(41)= lhs-rhs;
lhs =y(7);
rhs =params(33);
residual(42)= lhs-rhs;
lhs =y(3);
rhs =y(29)+params(5);
residual(43)= lhs-rhs;
lhs =y(49);
rhs =4*y(3);
residual(44)= lhs-rhs;
lhs =y(41);
rhs =y(48)+y(29)+y(29)+y(48);
residual(45)= lhs-rhs;
lhs =y(47);
rhs =y(29);
residual(46)= lhs-rhs;
lhs =y(48);
rhs =y(47);
residual(47)= lhs-rhs;
lhs =y(2);
rhs =y(31)+params(51);
residual(48)= lhs-rhs;
lhs =y(50);
rhs =4*y(2);
residual(49)= lhs-rhs;
lhs =y(1);
rhs =y(28)+params(4);
residual(50)= lhs-rhs;
lhs =y(51);
rhs =y(42)-y(44);
residual(51)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(51, 51);

  %
  % Jacobian matrix
  %

T395 = 1-(T89/(1+T89)+1/(1+T89));
T397 = 1/(1-T89)-T89/(1-T89);
  g1(1,31)=(-4);
  g1(1,42)=1;
  g1(2,41)=(-1);
  g1(2,43)=1;
  g1(3,29)=(-4);
  g1(3,44)=1;
  g1(4,16)=1;
  g1(4,27)=(-1);
  g1(4,45)=1;
  g1(5,27)=(-1);
  g1(5,46)=1;
  g1(6,42)=1-params(52);
  g1(6,43)=(-(params(56)+params(57)));
  g1(6,45)=(-(params(65)+params(66)));
  g1(7,11)=(-params(9));
  g1(7,18)=(-(1-params(9)));
  g1(7,32)=1;
  g1(8,10)=1;
  g1(8,11)=(-T55);
  g1(9,11)=1;
  g1(9,12)=1;
  g1(9,17)=(-1);
  g1(9,18)=(-1);
  g1(10,10)=(-1);
  g1(10,12)=1;
  g1(10,39)=(-1);
  g1(11,13)=(-(T71*1/T76));
  g1(11,15)=1-(1+params(37)*params(35))*T71;
  g1(11,35)=(-1);
  g1(12,11)=(-(params(40)/(params(40)+1-params(13))));
  g1(12,13)=1-T105;
  g1(12,19)=1;
  g1(12,33)=(-(1/T94));
  g1(13,14)=T395;
  g1(13,19)=T94;
  g1(13,33)=(-1);
  g1(14,10)=(-params(48));
  g1(14,14)=(-params(47));
  g1(14,15)=(-params(46));
  g1(14,16)=1;
  g1(14,34)=(-1);
  g1(15,12)=(-(params(9)*params(18)));
  g1(15,16)=1;
  g1(15,17)=(-((1-params(9))*params(18)));
  g1(15,32)=(-params(18));
  g1(16,14)=(-T397);
  g1(16,17)=(-params(23));
  g1(16,18)=1;
  g1(17,15)=(-params(42));
  g1(17,35)=(-(T76*params(42)));
  g1(17,39)=1-(1-params(42));
  g1(18,20)=1;
  g1(18,22)=(-params(9));
  g1(18,30)=(-(1-params(9)));
  g1(18,32)=1;
  g1(19,21)=1;
  g1(19,22)=(-T55);
  g1(20,22)=1;
  g1(20,23)=1;
  g1(20,28)=(-1);
  g1(20,30)=(-1);
  g1(21,21)=(-1);
  g1(21,23)=1;
  g1(21,40)=(-1);
  g1(22,24)=(-(T71*1/T76));
  g1(22,26)=1-(1+params(37)*params(35))*T71;
  g1(22,35)=(-1);
  g1(23,22)=(-(params(40)/(params(40)+1-params(13))));
  g1(23,24)=1-T105;
  g1(23,29)=(-1);
  g1(23,31)=1;
  g1(23,33)=(-(1/T94));
  g1(24,25)=T395;
  g1(24,29)=(-T94);
  g1(24,31)=T94;
  g1(24,33)=(-1);
  g1(25,21)=(-params(48));
  g1(25,25)=(-params(47));
  g1(25,26)=(-params(46));
  g1(25,27)=1;
  g1(25,34)=(-1);
  g1(26,23)=(-(params(9)*params(18)));
  g1(26,27)=1;
  g1(26,28)=(-((1-params(9))*params(18)));
  g1(26,32)=(-params(18));
  g1(27,20)=(-(T220*T234));
  g1(27,29)=1-T220*(params(37)*params(35)+params(21));
  g1(27,37)=(-1);
  g1(28,25)=(-(T269*T397));
  g1(28,28)=(-(params(23)*T269));
  g1(28,29)=(-(T242+params(19)/(1+params(37)*params(35))-(1+params(37)*params(35)*params(19))/(1+params(37)*params(35))));
  g1(28,30)=1-(T71+T242-T269);
  g1(28,38)=(-1);
  g1(29,32)=1-params(26);
  g1(30,33)=1-params(27);
  g1(31,34)=1-params(28);
  g1(32,35)=1-params(29);
  g1(33,36)=1-params(30);
  g1(34,9)=(-(1-params(8)));
  g1(34,37)=1-params(31);
  g1(35,9)=1;
  g1(36,8)=(-(1-params(7)));
  g1(36,38)=1-params(32);
  g1(37,8)=1;
  g1(38,26)=(-params(42));
  g1(38,35)=(-(params(12)*T74*params(42)));
  g1(38,40)=1-(1-params(42));
  g1(39,4)=1;
  g1(40,5)=1;
  g1(41,6)=1;
  g1(42,7)=1;
  g1(43,3)=1;
  g1(43,29)=(-1);
  g1(44,3)=(-4);
  g1(44,49)=1;
  g1(45,29)=(-2);
  g1(45,41)=1;
  g1(45,48)=(-2);
  g1(46,29)=(-1);
  g1(46,47)=1;
  g1(47,47)=(-1);
  g1(47,48)=1;
  g1(48,2)=1;
  g1(48,31)=(-1);
  g1(49,2)=(-4);
  g1(49,50)=1;
  g1(50,1)=1;
  g1(50,28)=(-1);
  g1(51,42)=(-1);
  g1(51,44)=1;
  g1(51,51)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],51,2601);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],51,132651);
end
end
end
end
