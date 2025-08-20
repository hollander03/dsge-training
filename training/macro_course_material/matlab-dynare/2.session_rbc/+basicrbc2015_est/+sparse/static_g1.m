function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(2, 1);
end
[T_order, T] = basicrbc2015_est.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(25, 1);
g1_v(1)=1;
g1_v(2)=(-1);
g1_v(3)=(-(params(1)*1/T(1)));
g1_v(4)=1;
g1_v(5)=(-1);
g1_v(6)=(-(1-T(2)));
g1_v(7)=params(7);
g1_v(8)=1;
g1_v(9)=(-(1-params(1)));
g1_v(10)=(-T(2));
g1_v(11)=(-params(3));
g1_v(12)=params(1)*1/T(1);
g1_v(13)=1-(1-params(3));
g1_v(14)=(-params(1));
g1_v(15)=1/params(7);
g1_v(16)=1;
g1_v(17)=(-1);
g1_v(18)=1-params(4);
g1_v(19)=1;
g1_v(20)=1;
g1_v(21)=1;
g1_v(22)=(-1);
g1_v(23)=1-params(5);
g1_v(24)=(-1);
g1_v(25)=1-params(6);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 12, 12);
end
