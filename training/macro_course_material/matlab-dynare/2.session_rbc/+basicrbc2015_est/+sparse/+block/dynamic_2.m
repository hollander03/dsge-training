function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(6, 1);
  residual(1)=(y(13))-(y(19)+params(1)*y(5)+y(15)*(1-params(1)));
  residual(2)=(y(13))-(y(23)+y(14)*(1-params(3)*params(1)/(1/params(2)-(1-params(3))))+y(16)*params(3)*params(1)/(1/params(2)-(1-params(3))));
  residual(3)=(y(14)*params(7))-(y(13)-y(15));
  residual(4)=(y(17))-((1-params(3))*y(5)+params(3)*y(16));
  T(1)=params(1)*1/(params(1)/(1/params(2)-(1-params(3))));
  residual(5)=(y(18))-((y(13)-y(5))*T(1));
  residual(6)=(1/params(7)*y(30))-(y(26)-y(14)+y(24));
if nargout > 3
    g1_v = NaN(18, 1);
g1_v(1)=(-params(1));
g1_v(2)=(-(1-params(3)));
g1_v(3)=T(1);
g1_v(4)=(-(1-params(1)));
g1_v(5)=1;
g1_v(6)=(-(params(3)*params(1)/(1/params(2)-(1-params(3)))));
g1_v(7)=(-params(3));
g1_v(8)=1;
g1_v(9)=1;
g1_v(10)=(-1);
g1_v(11)=(-T(1));
g1_v(12)=1;
g1_v(13)=1;
g1_v(14)=(-(1-params(3)*params(1)/(1/params(2)-(1-params(3)))));
g1_v(15)=params(7);
g1_v(16)=1;
g1_v(17)=1/params(7);
g1_v(18)=(-1);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 6, 18);
end
end
