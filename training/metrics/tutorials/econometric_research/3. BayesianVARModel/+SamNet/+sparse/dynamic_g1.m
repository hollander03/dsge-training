function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(13, 1);
end
[T_order, T] = SamNet.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(101, 1);
g1_v(1)=(-(y(31)*params(1)*(-params(39))/(y(40)-y(21)*params(39))));
g1_v(2)=(-(params(6)*y(36)*(-params(39))/(y(24)*(1-params(39)))+y(47)*params(1)*(-params(39))/(y(40)-y(21)*params(39))));
g1_v(3)=(-(params(7)/(1-y(26))*(-params(39))/(1-params(39))));
g1_v(4)=(-(T(7)*params(2)*(-params(39))/(y(41)-params(39)*y(22))));
g1_v(5)=(-(y(27)*y(26)*params(5)*(-(y(51)*params(2)*(-params(39))/(y(41)-params(39)*y(22))))));
g1_v(6)=(-((y(51)-y(31)*(1-y(35)))*params(3)*(-params(39))/(y(42)-params(39)*y(23))));
g1_v(7)=(-y(28));
g1_v(8)=(-y(28));
g1_v(9)=(-(T(5)*y(37)*getPowerDeriv(y(6),params(8),1)));
g1_v(10)=(-y(12));
g1_v(11)=y(12);
g1_v(12)=y(32)+params(37)/(2*params(28))*(-(2*(y(30)-y(11))));
g1_v(13)=(-T(8));
g1_v(14)=params(38)/(2*params(28))*(-(2*(y(30)-y(11))))-y(32);
g1_v(15)=(-(params(38)/params(28)));
g1_v(16)=(-y(10));
g1_v(17)=y(10);
g1_v(18)=(-(params(9)*1/y(17)));
g1_v(19)=(-(params(10)*1/y(18)));
g1_v(20)=(-params(11));
g1_v(21)=1;
g1_v(22)=1;
g1_v(23)=(-(y(31)*T(11)));
g1_v(24)=(-(params(6)*y(36)*1/(y(24)*(1-params(39)))+y(47)*T(11)));
g1_v(25)=(-(params(7)/(1-y(26))*1/(1-params(39))));
g1_v(26)=(-1);
g1_v(27)=1;
g1_v(28)=(-(T(7)*T(12)));
g1_v(29)=(-(y(27)*y(26)*params(5)*(-(y(51)*T(12)))));
g1_v(30)=(-1);
g1_v(31)=1;
g1_v(32)=(-((y(51)-y(31)*(1-y(35)))*params(3)*(y(42)-params(39)*y(23)-(y(23)-params(39)*y(4))*(-params(39)))/((y(42)-params(39)*y(23))*(y(42)-params(39)*y(23)))));
g1_v(33)=(-1);
g1_v(34)=y(28);
g1_v(35)=(-(params(6)*y(36)*(-((y(21)-params(39)*y(2))*(1-params(39))))/(y(24)*(1-params(39))*y(24)*(1-params(39)))));
g1_v(36)=1;
g1_v(37)=y(28);
g1_v(38)=(-(params(4)*y(47)/y(51)));
g1_v(39)=(-(T(6)*(-(params(8)*y(53)))/(y(25)*y(25))));
g1_v(40)=1;
g1_v(41)=(-y(27));
g1_v(42)=(-((y(21)-params(39)*y(2))/(1-params(39))*params(7)/((1-y(26))*(1-y(26)))));
g1_v(43)=y(27);
g1_v(44)=(-(T(4)*getPowerDeriv(y(26),1-params(8),1)));
g1_v(45)=y(27)*params(5);
g1_v(46)=(-(y(27)*(1+params(5)*(1-y(51)*T(6)))));
g1_v(47)=(-y(26));
g1_v(48)=1;
g1_v(49)=y(26);
g1_v(50)=y(26)*params(5);
g1_v(51)=(-(y(26)*(1+params(5)*(1-y(51)*T(6)))));
g1_v(52)=y(24)-y(5);
g1_v(53)=1;
g1_v(54)=y(25)-y(6);
g1_v(55)=1;
g1_v(56)=1;
g1_v(57)=(-1);
g1_v(58)=1;
g1_v(59)=params(37)/(2*params(28))*2*(y(30)-y(11))-1;
g1_v(60)=1;
g1_v(61)=T(8);
g1_v(62)=1+params(38)/(2*params(28))*2*(y(30)-y(11));
g1_v(63)=(-(1-y(35)));
g1_v(64)=params(38)/params(28);
g1_v(65)=(-(params(33)*1/y(34)/(params(28)/params(32))*T(13)));
g1_v(66)=(-T(1));
g1_v(67)=(-(T(9)*(-(1-y(35)))));
g1_v(68)=1;
g1_v(69)=y(11);
g1_v(70)=(-y(11));
g1_v(71)=(-1);
g1_v(72)=1;
g1_v(73)=(-1);
g1_v(74)=1;
g1_v(75)=1-params(8);
g1_v(76)=(-(params(33)*T(13)*(-y(30))/(y(34)*y(34))/(params(28)/params(32))));
g1_v(77)=y(30);
g1_v(78)=1-y(31)*T(9);
g1_v(79)=1;
g1_v(80)=(-(params(6)*(y(21)-params(39)*y(2))/(y(24)*(1-params(39)))));
g1_v(81)=1/y(36);
g1_v(82)=(-(T(3)*T(5)));
g1_v(83)=1/y(37);
g1_v(84)=1;
g1_v(85)=1;
g1_v(86)=(-(y(31)*params(1)*(-(y(21)-params(39)*y(2)))/((y(40)-y(21)*params(39))*(y(40)-y(21)*params(39)))));
g1_v(87)=(-(y(47)*params(1)*(-(y(21)-params(39)*y(2)))/((y(40)-y(21)*params(39))*(y(40)-y(21)*params(39)))));
g1_v(88)=(-(T(7)*params(2)*(-(y(22)-params(39)*y(3)))/((y(41)-params(39)*y(22))*(y(41)-params(39)*y(22)))));
g1_v(89)=(-(y(27)*y(26)*params(5)*(-(y(51)*params(2)*(-(y(22)-params(39)*y(3)))/((y(41)-params(39)*y(22))*(y(41)-params(39)*y(22)))))));
g1_v(90)=(-((y(51)-y(31)*(1-y(35)))*params(3)*(-(y(23)-params(39)*y(4)))/((y(42)-params(39)*y(23))*(y(42)-params(39)*y(23)))));
g1_v(91)=(-T(1));
g1_v(92)=(-(y(25)*params(4)*1/y(51)));
g1_v(93)=(-(params(4)*1/y(51)+T(6)*(1-params(4))-(y(30)-y(11))*params(4)*params(37)/params(28)*1/y(51)));
g1_v(94)=(-(y(25)*params(4)*(-y(47))/(y(51)*y(51))));
g1_v(95)=(-(params(4)*(-y(47))/(y(51)*y(51))-(y(30)-y(11))*params(4)*params(37)/params(28)*(-y(47))/(y(51)*y(51))));
g1_v(96)=(-(y(27)*y(26)*params(5)*(-T(6))));
g1_v(97)=(-T(9));
g1_v(98)=(-(T(6)*params(8)/y(25)));
g1_v(99)=(-1);
g1_v(100)=(-1);
g1_v(101)=(-1);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 19, 60);
end