function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(1, 1);
end
[T_order, T] = basicNKM.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(30, 1);
g1_v(1)=1;
g1_v(2)=(-(params(3)+params(5)));
g1_v(3)=(-1);
g1_v(4)=(-1);
g1_v(5)=(-(params(3)/params(4)));
g1_v(6)=1;
g1_v(7)=T(1);
g1_v(8)=(-1);
g1_v(9)=params(1)*1/params(4);
g1_v(10)=1;
g1_v(11)=1-params(11);
g1_v(12)=(-1);
g1_v(13)=1-params(1);
g1_v(14)=(-((1-params(11))*params(7)));
g1_v(15)=(-((1-params(6))*(1-params(6)*params(1))/params(6)));
g1_v(16)=1;
g1_v(17)=1;
g1_v(18)=1;
g1_v(19)=1+params(5);
g1_v(20)=1-params(9);
g1_v(21)=(-(1+params(5)));
g1_v(22)=(-1);
g1_v(23)=1-params(10);
g1_v(24)=1;
g1_v(25)=params(3)+params(5);
g1_v(26)=1;
g1_v(27)=(-1);
g1_v(28)=T(1);
g1_v(29)=(-((1-params(11))*params(8)));
g1_v(30)=1;
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 14, 14);
end
