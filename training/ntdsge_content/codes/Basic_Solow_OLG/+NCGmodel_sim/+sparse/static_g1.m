function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(16, 1);
end
[T_order, T] = NCGmodel_sim.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(13, 1);
g1_v(1)=T(13)-T(8)*params(1)*T(13);
g1_v(2)=1;
g1_v(3)=1;
g1_v(4)=(-(T(5)*params(1)*T(7)*params(4)*exp(y(4))*getPowerDeriv(y(2),params(4)-1,1)));
g1_v(5)=(-((1-y(3))*T(10)*exp(y(4))*(1-params(4))*params(2)/(1-params(2))*T(14)));
g1_v(6)=1-(1-params(3)+T(7)*exp(y(4))*T(14));
g1_v(7)=T(15)-(T(8)*params(1)*T(15)+T(5)*params(1)*T(6)*T(16));
g1_v(8)=(-((1-y(3))*exp(y(4))*(1-params(4))*params(2)/(1-params(2))*T(9)*getPowerDeriv(y(3),(-params(4)),1)-exp(y(4))*(1-params(4))*params(2)/(1-params(2))*T(9)*T(10)));
g1_v(9)=(-(exp(y(4))*T(9)*T(16)));
g1_v(10)=(-(T(5)*params(1)*T(6)*T(7)));
g1_v(11)=(-T(11));
g1_v(12)=(-(T(7)*exp(y(4))*T(9)));
g1_v(13)=1-params(6);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 4, 4);
end
