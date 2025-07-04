function [y, T, residual, g1] = static_6(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(5, 1);
  residual(1)=(y(1))-(y(11)+(1-params(3)*params(1)/(1/params(2)-(1-params(3))))*y(2)+params(3)*params(1)/(1/params(2)-(1-params(3)))*y(4));
  residual(2)=(y(1))-(y(7)+params(1)*y(5)+y(3)*(1-params(1)));
  residual(3)=(y(2)*params(7))-(y(1)-y(3));
  residual(4)=(y(5))-((1-params(3))*y(5)+params(3)*y(4));
  T(1)=params(1)*1/(params(1)/(1/params(2)-(1-params(3))));
  residual(5)=(y(6))-((y(1)-y(5))*T(1));
if nargout > 3
    g1_v = NaN(13, 1);
g1_v(1)=1;
g1_v(2)=1;
g1_v(3)=(-1);
g1_v(4)=(-T(1));
g1_v(5)=(-(1-params(1)));
g1_v(6)=1;
g1_v(7)=(-(1-params(3)*params(1)/(1/params(2)-(1-params(3)))));
g1_v(8)=params(7);
g1_v(9)=(-(params(3)*params(1)/(1/params(2)-(1-params(3)))));
g1_v(10)=(-params(3));
g1_v(11)=(-params(1));
g1_v(12)=1-(1-params(3));
g1_v(13)=T(1);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 5, 5);
end
end
