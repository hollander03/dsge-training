function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(2, 1);
end
[T_order, T] = basicrbc2015_est.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(38, 1);
g1_v(1)=1;
g1_v(2)=1;
g1_v(3)=params(1)*1/T(1);
g1_v(4)=(-(1-params(3)));
g1_v(5)=(-params(1));
g1_v(6)=(-params(4));
g1_v(7)=(-params(5));
g1_v(8)=(-params(6));
g1_v(9)=1;
g1_v(10)=(-1);
g1_v(11)=(-(params(1)*1/T(1)));
g1_v(12)=1;
g1_v(13)=(-1);
g1_v(14)=(-(1-T(2)));
g1_v(15)=1;
g1_v(16)=params(7);
g1_v(17)=(-1);
g1_v(18)=1;
g1_v(19)=(-(1-params(1)));
g1_v(20)=(-T(2));
g1_v(21)=(-params(3));
g1_v(22)=(-1);
g1_v(23)=1;
g1_v(24)=1;
g1_v(25)=(-1);
g1_v(26)=1;
g1_v(27)=1;
g1_v(28)=1;
g1_v(29)=1;
g1_v(30)=(-1);
g1_v(31)=1;
g1_v(32)=(-1);
g1_v(33)=1;
g1_v(34)=(-1);
g1_v(35)=1/params(7);
g1_v(36)=(-1);
g1_v(37)=(-1);
g1_v(38)=(-1);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 12, 39);
end
