function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(31, 1);
end
[T_order, T] = NCGmodel_sim.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(18, 1);
g1_v(1)=(-(T(9)*T(25)));
g1_v(2)=(-((1-y(7))*T(15)*T(13)*T(26)));
g1_v(3)=(-(1-params(3)+T(11)*exp(y(4))*T(26)));
g1_v(4)=(-(T(9)*T(10)*T(11)));
g1_v(5)=(-T(16));
g1_v(6)=(-(T(11)*exp(y(4))*T(14)));
g1_v(7)=(-params(6));
g1_v(8)=(y(5)*T(18)*T(19)-T(4))/(y(5)*y(5));
g1_v(9)=1;
g1_v(10)=1;
g1_v(11)=1;
g1_v(12)=T(19)*T(1)*T(27)/y(5)-T(9)*T(10)*T(28);
g1_v(13)=(-((1-y(7))*T(13)*T(14)*T(29)-T(13)*T(14)*T(15)));
g1_v(14)=(-(exp(y(4))*T(14)*T(28)));
g1_v(15)=1;
g1_v(16)=(-(T(12)*T(23)));
g1_v(17)=(-(T(12)*T(31)));
g1_v(18)=(-params(7));
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 4, 13);
end
