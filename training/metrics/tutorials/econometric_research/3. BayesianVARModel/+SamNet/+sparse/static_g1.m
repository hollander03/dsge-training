function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(5, 1);
end
[T_order, T] = SamNet.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(64, 1);
g1_v(1)=1;
g1_v(2)=1;
g1_v(3)=(-(params(6)*y(17)*(1-params(39))/(y(5)*(1-params(39)))));
g1_v(4)=(-(params(7)/(1-y(7))));
g1_v(5)=(-1);
g1_v(6)=1;
g1_v(7)=(-1);
g1_v(8)=1;
g1_v(9)=(-1);
g1_v(10)=(-(params(6)*y(17)*(-((y(2)-y(2)*params(39))*(1-params(39))))/(y(5)*(1-params(39))*y(5)*(1-params(39)))));
g1_v(11)=1;
g1_v(12)=(-(T(3)*y(18)*getPowerDeriv(y(6),params(8),1)));
g1_v(13)=(-(params(4)*y(9)/y(13)));
g1_v(14)=(-(params(2)*(-(y(15)*params(8)))/(y(6)*y(6))));
g1_v(15)=1;
g1_v(16)=(-y(8));
g1_v(17)=(-((y(2)-y(2)*params(39))/(1-params(39))*params(7)/((1-y(7))*(1-y(7)))));
g1_v(18)=y(8);
g1_v(19)=(-(T(2)*getPowerDeriv(y(7),1-params(8),1)));
g1_v(20)=y(8)*params(5);
g1_v(21)=(-(y(8)*(1+params(5)*(1-y(13)*params(2)))));
g1_v(22)=(-y(7));
g1_v(23)=1;
g1_v(24)=y(7);
g1_v(25)=y(7)*params(5);
g1_v(26)=(-(y(7)*(1+params(5)*(1-y(13)*params(2)))));
g1_v(27)=1-params(1);
g1_v(28)=(-(y(6)*params(4)*1/y(13)));
g1_v(29)=1-(params(4)*1/y(13)+params(2)*(1-params(4)));
g1_v(30)=1-y(12);
g1_v(31)=y(12)-1;
g1_v(32)=1;
g1_v(33)=y(13)-1;
g1_v(34)=1;
g1_v(35)=1-y(13);
g1_v(36)=(-(1-y(16)));
g1_v(37)=(-(params(33)*1/y(15)/(params(28)/params(32))*T(5)));
g1_v(38)=(-y(10));
g1_v(39)=(-params(1));
g1_v(40)=y(10);
g1_v(41)=(-(params(3)*(-(1-y(16)))));
g1_v(42)=1;
g1_v(43)=y(11);
g1_v(44)=(-(y(6)*params(4)*(-y(9))/(y(13)*y(13))));
g1_v(45)=(-(params(4)*(-y(9))/(y(13)*y(13))));
g1_v(46)=(-(y(8)*y(7)*params(5)*(-params(2))));
g1_v(47)=(-y(11));
g1_v(48)=(-params(3));
g1_v(49)=(-1);
g1_v(50)=1;
g1_v(51)=(-1);
g1_v(52)=1;
g1_v(53)=(-(params(2)*params(8)/y(6)));
g1_v(54)=1-params(8);
g1_v(55)=(-(params(33)*T(5)*(-y(11))/(y(15)*y(15))/(params(28)/params(32))));
g1_v(56)=y(11);
g1_v(57)=1-y(12)*params(3);
g1_v(58)=1;
g1_v(59)=(-(params(6)*(y(2)-y(2)*params(39))/(y(5)*(1-params(39)))));
g1_v(60)=1/y(17)-params(9)*1/y(17);
g1_v(61)=(-(T(1)*T(3)));
g1_v(62)=1/y(18)-params(10)*1/y(18);
g1_v(63)=1;
g1_v(64)=1-params(11);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 19, 19);
end
