function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(6, 1);
  residual(1)=(y(12)*params(5))-(y(11)-y(13));
  residual(2)=(y(11))-(y(17)+params(1)*y(5)+y(13)*(1-params(1)));
  residual(3)=(y(11))-(y(12)*(1-params(3)*params(1)/(1/params(2)-(1-params(3))))+y(14)*params(3)*params(1)/(1/params(2)-(1-params(3))));
  residual(4)=(y(15))-((1-params(3))*y(5)+params(3)*y(14));
  residual(5)=(1/params(5)*y(26))-(y(22)-y(12));
  T(1)=params(1)*1/(params(1)/(1/params(2)-(1-params(3))));
  residual(6)=(y(16))-((y(11)-y(5))*T(1));
if nargout > 3
    g1_v = NaN(18, 1);
g1_v(1)=(-params(1));
g1_v(2)=(-(1-params(3)));
g1_v(3)=T(1);
g1_v(4)=(-1);
g1_v(5)=1;
g1_v(6)=1;
g1_v(7)=(-T(1));
g1_v(8)=1;
g1_v(9)=(-(1-params(1)));
g1_v(10)=(-(params(3)*params(1)/(1/params(2)-(1-params(3)))));
g1_v(11)=(-params(3));
g1_v(12)=1;
g1_v(13)=params(5);
g1_v(14)=(-(1-params(3)*params(1)/(1/params(2)-(1-params(3)))));
g1_v(15)=1;
g1_v(16)=1;
g1_v(17)=(-1);
g1_v(18)=1/params(5);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 6, 18);
end
end
