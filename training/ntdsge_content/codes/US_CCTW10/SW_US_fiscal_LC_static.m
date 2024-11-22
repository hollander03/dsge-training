function [residual, g1, g2, g3] = SW_US_fiscal_LC_static(y, x, params)
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

residual = zeros( 62, 1);

%
% Model equations
%

T55 = 1/(params(10)/(1-params(10)));
T71 = 1/(1+params(42)*params(40));
T74 = params(40)^2;
T76 = T74*params(12);
T89 = params(15)/params(40);
T94 = (1-T89)/(params(14)*(1+T89));
T105 = (1-params(13))/(params(45)+1-params(13));
T126 = 1/params(52);
T268 = 1/(1+params(42)*params(40)*params(21));
T282 = (1-params(22))*(1-params(42)*params(40)*params(22))/params(22)/(1+(params(18)-1)*params(3));
T290 = params(42)*params(40)/(1+params(42)*params(40));
T317 = (1-params(20))*(1-params(42)*params(40)*params(20))/((1+params(42)*params(40))*params(20))*1/(1+(params(24)-1)*params(1));
lhs =y(50);
rhs =y(31)*4;
residual(1)= lhs-rhs;
lhs =y(51);
rhs =y(41);
residual(2)= lhs-rhs;
lhs =y(52);
rhs =4*y(29);
residual(3)= lhs-rhs;
lhs =y(53);
rhs =y(27)-y(16);
residual(4)= lhs-rhs;
lhs =y(54);
rhs =y(27);
residual(5)= lhs-rhs;
lhs =y(50);
rhs =y(50)*params(62)+y(51)*params(66)+y(51)*params(67)+y(53)*params(75)+y(53)*params(76);
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
rhs =T71*(y(15)+y(15)*params(42)*params(40)+1/T76*y(13))+y(35);
residual(11)= lhs-rhs;
lhs =y(13);
rhs =(-y(19))+y(33)*1/T94+y(11)*params(45)/(params(45)+1-params(13))+y(13)*T105;
residual(12)= lhs-rhs;
lhs =y(47);
rhs =y(33)+y(47)*T89/(1+T89)+y(47)*1/(1+T89)-y(19)*T94;
residual(13)= lhs-rhs;
lhs =y(46);
rhs =(y(18)+y(17))*params(54)-T126*y(49);
residual(14)= lhs-rhs;
lhs =y(14);
rhs =y(47)*(1-params(60))+y(46)*params(60);
residual(15)= lhs-rhs;
lhs =y(16);
rhs =params(52)*y(14)+y(15)*params(51)+y(34)+y(10)*params(53);
residual(16)= lhs-rhs;
lhs =y(16);
rhs =params(18)*(y(32)+params(9)*y(12)+(1-params(9))*y(17));
residual(17)= lhs-rhs;
lhs =y(18);
rhs =y(17)*params(23)+y(47)*1/(1-T89)-y(47)*T89/(1-T89);
residual(18)= lhs-rhs;
lhs =y(39);
rhs =y(39)*(1-params(47))+y(15)*params(47)+y(35)*T76*params(47);
residual(19)= lhs-rhs;
lhs =y(48);
rhs =params(43)*(y(34)+y(48)*1/params(44)-y(49));
residual(20)= lhs-rhs;
lhs =y(49);
rhs =y(48)*params(58)+y(34)*params(59);
residual(21)= lhs-rhs;
lhs =y(20);
rhs =params(9)*y(22)+(1-params(9))*y(30)-y(32);
residual(22)= lhs-rhs;
lhs =y(21);
rhs =T55*y(22);
residual(23)= lhs-rhs;
lhs =y(22);
rhs =y(30)+y(28)-y(23);
residual(24)= lhs-rhs;
lhs =y(23);
rhs =y(21)+y(40);
residual(25)= lhs-rhs;
lhs =y(40);
rhs =(1-params(47))*y(40)+params(47)*y(26)+y(35)*params(12)*T74*params(47);
residual(26)= lhs-rhs;
lhs =y(26);
rhs =y(35)+T71*(y(26)+params(42)*params(40)*y(26)+1/T76*y(24));
residual(27)= lhs-rhs;
lhs =y(24);
rhs =T105*y(24)+params(45)/(params(45)+1-params(13))*y(22)+y(33)*1/T94+y(29)-y(31);
residual(28)= lhs-rhs;
lhs =y(43);
rhs =y(33)+T89/(1+T89)*y(43)+1/(1+T89)*y(43)-T94*(y(31)-y(29));
residual(29)= lhs-rhs;
lhs =y(42);
rhs =params(54)*(y(30)+y(28))-T126*y(45);
residual(30)= lhs-rhs;
lhs =y(25);
rhs =(1-params(60))*y(43)+params(60)*y(42);
residual(31)= lhs-rhs;
lhs =y(27);
rhs =y(34)+params(52)*y(25)+params(51)*y(26)+params(53)*y(21);
residual(32)= lhs-rhs;
lhs =y(27);
rhs =params(18)*(y(32)+params(9)*y(23)+(1-params(9))*y(28));
residual(33)= lhs-rhs;
lhs =y(29);
rhs =T268*(y(29)*params(42)*params(40)+y(29)*params(21)+y(20)*T282)+y(37);
residual(34)= lhs-rhs;
lhs =y(30);
rhs =T71*y(30)+y(30)*T290+y(29)*params(19)/(1+params(42)*params(40))-y(29)*(1+params(42)*params(40)*params(19))/(1+params(42)*params(40))+y(29)*T290+T317*(params(23)*y(28)+1/(1-T89)*y(43)-T89/(1-T89)*y(43)-y(30))+y(38);
residual(35)= lhs-rhs;
lhs =y(44);
rhs =params(43)*(y(34)+1/params(44)*y(44)-y(45));
residual(36)= lhs-rhs;
lhs =y(45);
rhs =y(34)*params(59)+params(58)*y(44)+y(45)*params(32)+x(8);
residual(37)= lhs-rhs;
lhs =y(32);
rhs =y(32)*params(30)+x(1);
residual(38)= lhs-rhs;
lhs =y(33);
rhs =y(33)*params(31)+x(2);
residual(39)= lhs-rhs;
lhs =y(34);
rhs =y(34)*params(33)+x(9)+x(3);
residual(40)= lhs-rhs;
lhs =y(35);
rhs =y(35)*params(34)+x(4);
residual(41)= lhs-rhs;
lhs =y(36);
rhs =y(36)*params(35)+x(5);
residual(42)= lhs-rhs;
lhs =y(37);
rhs =y(37)*params(36)+y(9)-y(9)*params(8);
residual(43)= lhs-rhs;
lhs =y(9);
rhs =x(6);
residual(44)= lhs-rhs;
lhs =y(38);
rhs =y(38)*params(37)+y(8)-y(8)*params(7);
residual(45)= lhs-rhs;
lhs =y(8);
rhs =x(7);
residual(46)= lhs-rhs;
residual(47) = y(57);
lhs =y(59);
rhs =params(9)*y(11)+(1-params(9))*y(18)-y(32);
residual(48)= lhs-rhs;
lhs =y(4);
rhs =params(38);
residual(49)= lhs-rhs;
lhs =y(5);
rhs =params(38);
residual(50)= lhs-rhs;
lhs =y(6);
rhs =params(38);
residual(51)= lhs-rhs;
lhs =y(7);
rhs =params(38);
residual(52)= lhs-rhs;
lhs =y(3);
rhs =y(29)+params(5);
residual(53)= lhs-rhs;
lhs =y(60);
rhs =4*y(3);
residual(54)= lhs-rhs;
lhs =y(41);
rhs =y(56)+y(29)+y(29)+y(56);
residual(55)= lhs-rhs;
lhs =y(55);
rhs =y(29);
residual(56)= lhs-rhs;
lhs =y(56);
rhs =y(55);
residual(57)= lhs-rhs;
lhs =y(2);
rhs =y(31)+params(56);
residual(58)= lhs-rhs;
lhs =y(62);
rhs =4*y(2);
residual(59)= lhs-rhs;
lhs =y(1);
rhs =y(28)+params(4);
residual(60)= lhs-rhs;
lhs =y(58);
rhs =y(62)-y(60);
residual(61)= lhs-rhs;
lhs =y(61);
rhs =4*y(4);
residual(62)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(62, 62);

  %
  % Jacobian matrix
  %

T498 = 1-(T89/(1+T89)+1/(1+T89));
T500 = 1/(1-T89)-T89/(1-T89);
  g1(1,31)=(-4);
  g1(1,50)=1;
  g1(2,41)=(-1);
  g1(2,51)=1;
  g1(3,29)=(-4);
  g1(3,52)=1;
  g1(4,16)=1;
  g1(4,27)=(-1);
  g1(4,53)=1;
  g1(5,27)=(-1);
  g1(5,54)=1;
  g1(6,50)=1-params(62);
  g1(6,51)=(-(params(66)+params(67)));
  g1(6,53)=(-(params(75)+params(76)));
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
  g1(11,15)=1-(1+params(42)*params(40))*T71;
  g1(11,35)=(-1);
  g1(12,11)=(-(params(45)/(params(45)+1-params(13))));
  g1(12,13)=1-T105;
  g1(12,19)=1;
  g1(12,33)=(-(1/T94));
  g1(13,19)=T94;
  g1(13,33)=(-1);
  g1(13,47)=T498;
  g1(14,17)=(-params(54));
  g1(14,18)=(-params(54));
  g1(14,46)=1;
  g1(14,49)=T126;
  g1(15,14)=1;
  g1(15,46)=(-params(60));
  g1(15,47)=(-(1-params(60)));
  g1(16,10)=(-params(53));
  g1(16,14)=(-params(52));
  g1(16,15)=(-params(51));
  g1(16,16)=1;
  g1(16,34)=(-1);
  g1(17,12)=(-(params(9)*params(18)));
  g1(17,16)=1;
  g1(17,17)=(-((1-params(9))*params(18)));
  g1(17,32)=(-params(18));
  g1(18,17)=(-params(23));
  g1(18,18)=1;
  g1(18,47)=(-T500);
  g1(19,15)=(-params(47));
  g1(19,35)=(-(T76*params(47)));
  g1(19,39)=1-(1-params(47));
  g1(20,34)=(-params(43));
  g1(20,48)=1-params(43)*1/params(44);
  g1(20,49)=params(43);
  g1(21,34)=(-params(59));
  g1(21,48)=(-params(58));
  g1(21,49)=1;
  g1(22,20)=1;
  g1(22,22)=(-params(9));
  g1(22,30)=(-(1-params(9)));
  g1(22,32)=1;
  g1(23,21)=1;
  g1(23,22)=(-T55);
  g1(24,22)=1;
  g1(24,23)=1;
  g1(24,28)=(-1);
  g1(24,30)=(-1);
  g1(25,21)=(-1);
  g1(25,23)=1;
  g1(25,40)=(-1);
  g1(26,26)=(-params(47));
  g1(26,35)=(-(params(12)*T74*params(47)));
  g1(26,40)=1-(1-params(47));
  g1(27,24)=(-(T71*1/T76));
  g1(27,26)=1-(1+params(42)*params(40))*T71;
  g1(27,35)=(-1);
  g1(28,22)=(-(params(45)/(params(45)+1-params(13))));
  g1(28,24)=1-T105;
  g1(28,29)=(-1);
  g1(28,31)=1;
  g1(28,33)=(-(1/T94));
  g1(29,29)=(-T94);
  g1(29,31)=T94;
  g1(29,33)=(-1);
  g1(29,43)=T498;
  g1(30,28)=(-params(54));
  g1(30,30)=(-params(54));
  g1(30,42)=1;
  g1(30,45)=T126;
  g1(31,25)=1;
  g1(31,42)=(-params(60));
  g1(31,43)=(-(1-params(60)));
  g1(32,21)=(-params(53));
  g1(32,25)=(-params(52));
  g1(32,26)=(-params(51));
  g1(32,27)=1;
  g1(32,34)=(-1);
  g1(33,23)=(-(params(9)*params(18)));
  g1(33,27)=1;
  g1(33,28)=(-((1-params(9))*params(18)));
  g1(33,32)=(-params(18));
  g1(34,20)=(-(T268*T282));
  g1(34,29)=1-T268*(params(42)*params(40)+params(21));
  g1(34,37)=(-1);
  g1(35,28)=(-(params(23)*T317));
  g1(35,29)=(-(T290+params(19)/(1+params(42)*params(40))-(1+params(42)*params(40)*params(19))/(1+params(42)*params(40))));
  g1(35,30)=1-(T71+T290-T317);
  g1(35,38)=(-1);
  g1(35,43)=(-(T317*T500));
  g1(36,34)=(-params(43));
  g1(36,44)=1-params(43)*1/params(44);
  g1(36,45)=params(43);
  g1(37,34)=(-params(59));
  g1(37,44)=(-params(58));
  g1(37,45)=1-params(32);
  g1(38,32)=1-params(30);
  g1(39,33)=1-params(31);
  g1(40,34)=1-params(33);
  g1(41,35)=1-params(34);
  g1(42,36)=1-params(35);
  g1(43,9)=(-(1-params(8)));
  g1(43,37)=1-params(36);
  g1(44,9)=1;
  g1(45,8)=(-(1-params(7)));
  g1(45,38)=1-params(37);
  g1(46,8)=1;
  g1(47,57)=1;
  g1(48,11)=(-params(9));
  g1(48,18)=(-(1-params(9)));
  g1(48,32)=1;
  g1(48,59)=1;
  g1(49,4)=1;
  g1(50,5)=1;
  g1(51,6)=1;
  g1(52,7)=1;
  g1(53,3)=1;
  g1(53,29)=(-1);
  g1(54,3)=(-4);
  g1(54,60)=1;
  g1(55,29)=(-2);
  g1(55,41)=1;
  g1(55,56)=(-2);
  g1(56,29)=(-1);
  g1(56,55)=1;
  g1(57,55)=(-1);
  g1(57,56)=1;
  g1(58,2)=1;
  g1(58,31)=(-1);
  g1(59,2)=(-4);
  g1(59,62)=1;
  g1(60,1)=1;
  g1(60,28)=(-1);
  g1(61,58)=1;
  g1(61,60)=1;
  g1(61,62)=(-1);
  g1(62,4)=(-4);
  g1(62,61)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],62,3844);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],62,238328);
end
end
end
end
