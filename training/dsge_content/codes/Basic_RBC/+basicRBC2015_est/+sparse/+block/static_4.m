function [y, T, residual, g1] = static_4(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(5, 1);
  residual(1)=(y(1))-(y(7)+params(1)*y(5)+y(3)*(1-params(1)));
  residual(2)=(y(1))-((1-params(3)*params(1)/(1/params(2)-(1-params(3))))*y(2)+params(3)*params(1)/(1/params(2)-(1-params(3)))*y(4));
  residual(3)=(y(2)*params(5))-(y(1)-y(3));
  T(1)=params(1)*1/(params(1)/(1/params(2)-(1-params(3))));
  residual(4)=(y(6))-((y(1)-y(5))*T(1));
  residual(5)=(y(5))-((1-params(3))*y(5)+params(3)*y(4));
if nargout > 3
    g1_v = NaN(13, 1);
g1_v(1)=1;
g1_v(2)=1;
g1_v(3)=(-1);
g1_v(4)=(-T(1));
g1_v(5)=(-(1-params(3)*params(1)/(1/params(2)-(1-params(3)))));
g1_v(6)=params(5);
g1_v(7)=(-(1-params(1)));
g1_v(8)=1;
g1_v(9)=(-params(1));
g1_v(10)=T(1);
g1_v(11)=1-(1-params(3));
g1_v(12)=(-(params(3)*params(1)/(1/params(2)-(1-params(3)))));
g1_v(13)=(-params(3));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 5, 5);
end
end
