function [y, T, residual, g1] = static_6(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(7, 1);
  residual(1)=(y(7))-(y(1)*(params(3)+params(5))-(1+params(5))*y(9));
  residual(2)=(y(14))-(y(1)-y(11));
  residual(3)=(y(5))-(y(5)*params(11)+(1-params(11))*(y(6)*params(7)+params(8)*y(14))+x(3));
  residual(4)=(y(1))-(y(2));
  residual(5)=(y(2))-(y(2)-1/params(3)*y(4));
  residual(6)=(y(5))-(y(4)+y(6));
  residual(7)=(y(6))-(y(10)+params(1)*y(6)+(1-params(6))*(1-params(6)*params(1))/params(6)*y(7));
if nargout > 3
    g1_v = NaN(15, 1);
g1_v(1)=(-(params(3)+params(5)));
g1_v(2)=(-1);
g1_v(3)=1;
g1_v(4)=1;
g1_v(5)=(-((1-params(11))*params(8)));
g1_v(6)=1-params(11);
g1_v(7)=1;
g1_v(8)=(-1);
g1_v(9)=1/params(3);
g1_v(10)=(-1);
g1_v(11)=(-((1-params(11))*params(7)));
g1_v(12)=(-1);
g1_v(13)=1-params(1);
g1_v(14)=1;
g1_v(15)=(-((1-params(6))*(1-params(6)*params(1))/params(6)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 7, 7);
end
end
